import 'dart:io';
import 'package:path_provider/path_provider.dart';

///@see https://github.com/theflutterfactory/Flutter-Tutorials/blob/read_write_files/lib/file_manager.dart
class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _createdReferenceFile(String nameFile) async {
    final path = await _localPath;
    return File('$path/$nameFile');
  }

  Future<bool> writeFile(String nameFile, String content) async {
    try {
      final file = await _createdReferenceFile(nameFile);

      file.writeAsString(content);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> getUri() async {
    return await _localPath;
  }
}
