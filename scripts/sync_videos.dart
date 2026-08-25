import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

const channelId = 'UCtCoUJXm0dAxEChyuYtDKuA';
// The uploads playlist ID is the channel ID with 'UC' replaced by 'UU'
const uploadsPlaylistId = 'UUtCoUJXm0dAxEChyuYtDKuA';

class Cat {
  final String slug;
  final String name;
  final String faIcon;
  final String color;
  final int order;
  const Cat(this.slug, this.name, this.faIcon, this.color, this.order);
}

final List<Cat> cats = [
  Cat('shorts', 'Shorts', 'fa-solid fa-film', '#7E57C2', 0),
  Cat('dhamma', 'Dhamma', 'fa-solid fa-book-open', '#43A047', 1),
  Cat('meditation', 'Meditation', 'fa-solid fa-spa', '#1E88E5', 2),
  Cat('vinaya', 'Vinaya', 'fa-solid fa-scale-balanced', '#FB8C00', 3),
  Cat('monklife', 'Monastic Life', 'fa-solid fa-hands-praying', '#F4A300', 4),
  Cat('tech', 'Tech & Projects', 'fa-solid fa-microchip', '#00897B', 5),
  Cat('alms', 'Alms', 'fa-solid fa-bowl-food', '#FBC02D', 6),
  Cat('story', 'Stories', 'fa-solid fa-person-chalkboard', '#6D4C41', 7),
  Cat('interview', 'Interviews', 'fa-solid fa-microphone', '#7E57C2', 8),
  Cat('other', 'Other', 'fa-solid fa-shapes', '#43A047', 9),
  Cat(
    'uncategorized',
    'No Category',
    'fa-solid fa-circle-question',
    '#1E88E5',
    10,
  ),
];

class Video {
  final String id, title, desc, dur;
  final DateTime pub;
  final List tags;
  Video(this.id, this.title, this.desc, this.pub, this.dur, this.tags);

  factory Video.from(Map j) {
    final p = DateTime.tryParse(j['publishedAt'] ?? '') ?? DateTime(2000);
    return Video(
      j['id'] ?? '',
      j['title'] ?? 'Untitled',
      j['description'] ?? '',
      p,
      j['duration'] ?? '',
      (j['tags'] as List?) ?? [],
    );
  }

  int secs() {
    final m = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?').firstMatch(dur);
    if (m == null) return 99999;
    return (int.tryParse(m[1] ?? '0') ?? 0) * 3600 +
        (int.tryParse(m[2] ?? '0') ?? 0) * 60 +
        (int.tryParse(m[3] ?? '0') ?? 0);
  }
}

String esc(String s) => s.replaceAll('"', '\\"').replaceAll('\n', ' ').trim();
String date(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

String catOf(Video v) {
  if (v.secs() < 180) return 'shorts';
  for (var t in v.tags) {
    if (t is String && t.startsWith('cat:')) {
      final clean = t.replaceFirst('cat:', '').trim().toLowerCase();
      switch (clean) {
        case 'dhamma':
          return 'dhamma';
        case 'meditation':
          return 'meditation';
        case 'vinaya':
          return 'vinaya';
        case 'monklife':
          return 'monklife';
        case 'tech':
          return 'tech';
        case 'alms':
          return 'alms';
        case 'story':
          return 'story';
        case 'interview':
          return 'interview';
        case 'other':
          return 'other';
      }
    }
  }
  return 'uncategorized';
}

/// Finds the root directory of the repository
Directory findProjectRoot() {
  Directory current = Directory.current;
  while (true) {
    if (File(p.join(current.path, 'hugo.toml')).existsSync() ||
        File(p.join(current.path, 'config.toml')).existsSync() ||
        Directory(p.join(current.path, '.git')).existsSync()) {
      return current;
    }
    final parent = current.parent;
    if (parent.path == current.path) break; // reached filesystem root
    current = parent;
  }
  return Directory.current;
}

Future<List<String>> fetchVideoIds(String apiKey) async {
  List<String> ids = [];
  String? pageToken;

  print("Fetching video IDs from uploads playlist ($uploadsPlaylistId)...");

  do {
    final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/playlistItems'
      '?part=contentDetails'
      '&playlistId=$uploadsPlaylistId'
      '&key=$apiKey'
      '&maxResults=50'
      '${pageToken != null ? '&pageToken=$pageToken' : ''}',
    );

    final response = await http.get(url);
    if (response.statusCode != 200) {
      print("HTTP Error fetching playlist: ${response.statusCode}\n${response.body}");
      break;
    }

    final data = jsonDecode(response.body);
    for (var item in data['items'] ?? []) {
      final videoId = item['contentDetails']?['videoId'];
      if (videoId != null && videoId is String && videoId.isNotEmpty) {
        ids.add(videoId);
      }
    }

    print("Fetched ${data['items']?.length ?? 0} IDs → Total: ${ids.length}");
    pageToken = data['nextPageToken'];
  } while (pageToken != null);

  print("Finished fetching IDs! Total: ${ids.length}\n");
  return ids;
}

Future<List<Map<String, dynamic>>> fetchVideoDetails(
  List<String> ids,
  String apiKey,
) async {
  List<Map<String, dynamic>> results = [];
  const chunkSize = 50;

  print("Fetching details for ${ids.length} videos in chunks of $chunkSize...\n");

  for (int i = 0; i < ids.length; i += chunkSize) {
    final chunk = ids.sublist(
      i,
      i + chunkSize > ids.length ? ids.length : i + chunkSize,
    );
    final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/videos'
      '?part=snippet,contentDetails'
      '&id=${chunk.join(',')}'
      '&key=$apiKey',
    );

    final response = await http.get(url);
    if (response.statusCode != 200) {
      print("Failed chunk $i: ${response.statusCode}");
      continue;
    }

    final data = jsonDecode(response.body);
    for (var item in data['items'] ?? []) {
      final s = item['snippet'] ?? {};
      final c = item['contentDetails'] ?? {};

      results.add({
        'id': item['id'],
        'title': s['title'] ?? 'Untitled',
        'description': s['description'] ?? '',
        'publishedAt': s['publishedAt'] ?? '',
        'tags': s['tags'] ?? <String>[],
        'categoryId': s['categoryId'] ?? '',
        'duration': c['duration'] ?? 'PT0S',
      });
    }

    print("Processed ${results.length}/${ids.length}");
    await Future.delayed(Duration(milliseconds: 100)); // Rate limit buffer
  }

  return results;
}

Future<void> main() async {
  final root = findProjectRoot();
  final dataDir = Directory(p.join(root.path, 'data'));
  if (!dataDir.existsSync()) dataDir.createSync(recursive: true);

  final jsonFile = File(p.join(dataDir.path, 'videos_detail.json'));
  final outDir = Directory(p.join(root.path, 'content', 'videos'));
  final landingFile = File(p.join(root.path, 'content', 'youtube.md'));

  final apiKey = Platform.environment['YOUTUBE_API_KEY'];

  List<Map<String, dynamic>> videoData = [];

  if (apiKey != null && apiKey.isNotEmpty) {
    print("Found YOUTUBE_API_KEY. Fetching from YouTube API...");
    final ids = await fetchVideoIds(apiKey);
    if (ids.isNotEmpty) {
      videoData = await fetchVideoDetails(ids, apiKey);
      await jsonFile.writeAsString(
        const JsonEncoder.withIndent('  ').convert(videoData),
      );
      print("Saved ${videoData.length} video details to ${jsonFile.path}");
    } else {
      print("Warning: No videos found via API.");
    }
  } else {
    print("No YOUTUBE_API_KEY environment variable provided.");
  }

  // If API fetch was not run or returned empty, try reading existing JSON cache
  if (videoData.isEmpty) {
    if (jsonFile.existsSync()) {
      print("Loading cached video details from ${jsonFile.path}...");
      videoData = (jsonDecode(jsonFile.readAsStringSync()) as List)
          .cast<Map<String, dynamic>>();
    } else {
      print("ERROR: No API key provided and no cached videos_detail.json found.");
      exit(1);
    }
  }

  final List<Video> videos = videoData.map((j) => Video.from(j)).toList();

  final Map<String, List<Video>> byCat = {for (var c in cats) c.slug: []};

  for (var v in videos) {
    byCat[catOf(v)]!.add(v);
  }

  for (var key in byCat.keys) {
    byCat[key]!.sort((a, b) => b.pub.compareTo(a.pub));
  }

  if (!outDir.existsSync()) outDir.createSync(recursive: true);

  // Write category pages
  for (var c in cats) {
    final list = byCat[c.slug]!;
    if (list.isEmpty) continue;

    final out = File(p.join(outDir.path, '${c.slug}.md'));
    final sb = StringBuffer();
    sb.writeln('---');
    sb.writeln('title: "${c.name} Videos"');
    sb.writeln('---\n');
    sb.writeln('## ${c.name} Videos\n');
    for (var v in list) {
      sb.writeln(
        '{{< video-card id="${esc(v.id)}" title="${esc(v.title)}" date="${date(v.pub)}" >}}',
      );
      sb.writeln(esc(v.desc));
      sb.writeln('{{< /video-card >}}');
      sb.writeln();
    }
    out.writeAsStringSync(sb.toString());
    print('Wrote: ${out.path} (${list.length} videos)');
  }

  // Write landing page
  final sb = StringBuffer();
  sb.writeln('---');
  sb.writeln('title: "Videos"');
  sb.writeln(
    'description: "Bhante Subhūti – YouTube videos organised by topic."',
  );
  sb.writeln('---\n');
  sb.writeln('## Videos by Topic\n');
  sb.writeln('<div class="flex flex-wrap justify-center">\n');

  final ordered = List<Cat>.from(cats)
    ..sort((a, b) => a.order.compareTo(b.order));

  for (var c in ordered) {
    final count = byCat[c.slug]!.length;
    if (count == 0) continue;

    final displayName = c.slug == 'shorts' ? 'Shorts' : c.name;

    sb.writeln('  <!-- ${c.name} -->');
    sb.writeln('  <div class="w-100 w-50-m w-33-l pa3">');
    sb.writeln('    <a href="/videos/${c.slug}/" class="no-underline db">');
    sb.writeln(
      '      <div class="bg-card pa4 br3 shadow-4 w-100 h5 flex flex-column items-center justify-center tc hover-bg-light-gray pointer">',
    );
    sb.writeln(
      '        <i class="${c.faIcon} fa-3x mb3" style="color:${c.color};"></i>',
    );
    sb.writeln(
      '        <h3 class="f5 fw6 mt2 dark-gray">$displayName ($count)</h3>',
    );
    sb.writeln('      </div>');
    sb.writeln('    </a>');
    sb.writeln('  </div>\n');
  }

  sb.writeln('</div>');
  landingFile.writeAsStringSync(sb.toString());
  print('Wrote landing page: ${landingFile.path}');

  print('DONE – All categories and youtube.md generated successfully.');
}
