import 'dart:io';

void main(List<String> arguments) async {
  // Check for directory argument
  if (arguments.isEmpty) {
    print('Usage: dart script.dart <directory>');
    return;
  }

  final directoryPath = arguments[0];
  final directory = Directory(directoryPath);

  if (!directory.existsSync()) {
    print('Error: Directory not found.');
    return;
  }

  await processDirectory(directory);
}

Future<void> processDirectory(Directory directory) async {
  await for (var entity in directory.list(recursive: false)) {
    if (entity is File && entity.path.endsWith('.md')) {
      await processMarkdownFile(entity);
    } else if (entity is Directory) {
      // Optionally handle nested directories
      await processDirectory(entity);
    }
  }
}

Future<void> processMarkdownFile(File file) async {
  final filePath = file.path;
  final fileName = file.uri.pathSegments.last;
  final baseName =
      fileName.substring(0, fileName.length - 3); // Remove .md extension
  final newDirPath = '${file.parent.path}/$baseName';

  // Create new directory
  final newDirectory = Directory(newDirPath);
  if (!await newDirectory.exists()) {
    await newDirectory.create();
  }

  // Move and rename the .md file to index.md inside the new directory
  final newIndexFilePath = '$newDirPath/index.md';
  await file.rename(newIndexFilePath);

  print('Processed: $filePath -> $newIndexFilePath');
}
