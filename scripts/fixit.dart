import 'dart:io';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Usage: dart fixit.dart <directory>');
    exit(1);
  }

  final directory = Directory(arguments[0]);

  if (!directory.existsSync()) {
    print('Error: Directory not found.');
    exit(1);
  }

  final files = directory.listSync(recursive: true, followLinks: false);

  for (final file in files) {
    if (file is File && file.path.endsWith('.md')) {
      final lines = file.readAsLinesSync();
      final updatedLines = lines.map((line) => fixImageReference(line));
      file.writeAsStringSync(updatedLines.join('\n'));
    }
  }

  print('Image references in Markdown files have been updated.');
}

String fixImageReference(String line) {
  return line.replaceAllMapped(RegExp(r'!\[]\(assets/images/'), (match) {
    return '![](/images/';
  });
}
