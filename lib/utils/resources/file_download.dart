import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:xuprememax/utils/utils.dart';

class FileDownload {
  static Future<File> fromResponse(Uint8List base64Data) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = DateTime.now().toIso8601String();
    final filePath = '${directory.path}/$fileName.mp3';

    final file = File(filePath);
    await file.writeAsBytes(base64Data);
    return file;
  }
}
