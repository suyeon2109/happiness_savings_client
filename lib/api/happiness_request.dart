import 'package:dio/src/multipart_file.dart';

class HappinessRequest {
  final String title;
  final String content;
  final int happinessIndex;
  final String memberUuid;
  final MultipartFile imgFile;

  HappinessRequest(
      this.title, this.content, this.happinessIndex, this.memberUuid, this.imgFile);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'happinessIndex': happinessIndex,
      'memberUuid': memberUuid,
      'file' : imgFile
    };
  }
}
