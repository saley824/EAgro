
import 'package:image_picker/image_picker.dart';

enum MediaType { image, video }

class MediaFileModel {
  final String mediaUuid;

  final XFile mediaFile;
  final MediaType mediaType;

  MediaFileModel({
    required this.mediaFile,
    required this.mediaType,
    required this.mediaUuid,
  });
}
