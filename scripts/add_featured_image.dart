import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart script.dart <directory>');
    exit(1);
  }

  final directoryPath = arguments[0];
  final directory = Directory(directoryPath);

  if (!directory.existsSync()) {
    print('Error: Directory not found.');
    exit(1);
  }

  processDirectory(directory);
}

void processDirectory(Directory directory) {
  List<FileSystemEntity> entities = directory.listSync(recursive: true);
  for (var entity in entities) {
    if (entity is File && entity.path.endsWith('.md')) {
      processMarkdownFile(entity);
    }
  }
}

void processMarkdownFile(File file) {
  List<String> lines = file.readAsLinesSync();
  bool modified = false;
  List<String> newLines = [];
  String? imagePath;

  for (var line in lines) {
    if (line.startsWith('image:')) {
      imagePath =
          line.substring('image:'.length).trim().replaceAll('assets/', '');
      line = 'image: /images$imagePath';
      modified = true;
    } else if (line.contains('![')) {
      // Correct inline image paths and retain image after removing the domain
      line = line.replaceAllMapped(RegExp(r'\(assets/images/(.*?)\)'),
          (Match match) => '(/images/${match[1]})');
      line = line.replaceAllMapped(
          RegExp(r'\(https://subhuti.withmetta.net/wp-content/uploads/(.*?)\)'),
          (Match match) => '(/images/${match[1]})');
      modified = true;
    }
    newLines.add(line);
  }

  // Insert featured_image line in the front matter if an image line was modified and featured_image is not already present
  if (imagePath != null &&
      !newLines.any((line) => line.startsWith('featured_image:'))) {
    int frontMatterEndIndex = newLines.indexOf('---', 1);
    if (frontMatterEndIndex != -1) {
      newLines.insert(frontMatterEndIndex, 'featured_image: /images$imagePath');
      modified = true;
    }
  }

  if (modified) {
    file.writeAsStringSync(newLines.join('\n'));
    print('${file.path} updated.');
  }
}
