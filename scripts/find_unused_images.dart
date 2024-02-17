import 'dart:io';
import 'package:path/path.dart' as path;

Future<void> main() async {
  final postsDir = Directory('content/posts');
  final imagesDir = Directory('static/images');

  // Get the list of image files
  final imageFiles =
      await imagesDir.list().where((entity) => entity is File).toList();

  // Extract all image paths used in posts
  final usedImages = <String>{};
  await for (var post in postsDir.list(recursive: true)) {
    if (post is File && post.path.endsWith('.md')) {
      final content = await post.readAsString();
      // Updated regular expression to capture more patterns
      final RegExp imageRegExp = RegExp(r'\]\((.*?)\)');
      final matches = imageRegExp.allMatches(content);

      for (final match in matches) {
        final imagePath = match.group(1)!;
        // Check if imagePath starts with your images directory
        if (imagePath.startsWith('/images/')) {
          usedImages.add(path.normalize(imagePath));
        }
      }
    }
  }

  // Determine unused images
  final unusedImages = imageFiles.where((imageFile) {
    final relativeImagePath =
        path.relative(imageFile.path, from: imagesDir.path);
    // Normalize the path to ensure accurate comparison
    return !usedImages.contains('/' + relativeImagePath);
  }).toList();

  // Output the results
  if (unusedImages.isNotEmpty) {
    print('Unused images:');
    unusedImages.forEach((file) {
      print(path.relative(file.path, from: imagesDir.path));
    });
  } else {
    print('All images are used.');
  }
}
