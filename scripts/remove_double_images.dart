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
  final entities = directory.listSync(recursive: true);
  for (var entity in entities) {
    if (entity is File && entity.path.endsWith('.md')) {
      processMarkdownFile(entity);
    }
  }
}

void processMarkdownFile(File file) {
  final lines = file.readAsLinesSync();
  bool modified = false;
  final newLines = <String>[];

  for (var line in lines) {
    if (line.startsWith('image: /images/images/') ||
        line.startsWith('featured_image: /images/images/')) {
      line = line.replaceAll('/images/images/', '/images/');
      modified = true;
    }
    newLines.add(line);
  }

  if (modified) {
    file.writeAsStringSync(newLines.join('\n'));
    print('Updated: ${file.path}');
  }
}
