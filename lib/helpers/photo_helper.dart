import 'dart:io';

import 'package:file_picker/file_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

class PhotoUploadHelper {
  static Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      
    );
    File? image;
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      if (files.isNotEmpty) {
        image = files[0];
      }
    }

    return image;
  }
}
