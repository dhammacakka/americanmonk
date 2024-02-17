import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart add_date.dart <directory>');
    exit(1);
  }

  final directoryPath = arguments[0];
  final directory = Directory(directoryPath);

  if (!directory.existsSync()) {
    print('Error: Directory not found.');
    exit(1);
  }

  directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.md'))
      .forEach((file) {
    final lines = file.readAsLinesSync();
    final updatedLines = updateDateInLines(lines);

    if (updatedLines != null) {
      file.writeAsStringSync(updatedLines.join('\n'));
      print('${file.path} updated.');
    }
  });
}

List<String>? updateDateInLines(List<String> lines) {
  bool modified = false;
  int dateIndex = lines.indexWhere(
      (line) => line.startsWith('date:') || line.startsWith('created:'));

  if (dateIndex != -1) {
    final currentLine = lines[dateIndex];
    // Check if it starts with 'created:', if so, convert it.
    if (currentLine.startsWith('created:')) {
      final dateValue = currentLine.replaceFirst('created:', 'date:').trim();
      lines[dateIndex] = dateValue;
      modified = true;
    }
  } else {
    // If no 'date:' or 'created:' tag is found, add a default 'date:' tag at the beginning.
    lines.insert(0, 'date: 2012-01-01T00:00:00+00:00');
    modified = true;
  }

  return modified ? lines : null;
}
