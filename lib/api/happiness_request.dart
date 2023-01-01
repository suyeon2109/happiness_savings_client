

import 'package:http/http.dart';

class HappinessRequest {
  final String title;
  final String content;
  final int happinessIndex;
  final String userId;
  final MultipartFile? imgFile;

  HappinessRequest(
      this.title, this.content, this.happinessIndex, this.userId, this.imgFile);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'happinessIndex': happinessIndex,
      'memberUuid': userId,
      'file' : imgFile
    };
  }

  Map<String, String> toStringMap() {
    return {
      'title': title,
      'content': content,
      'happinessIndex': happinessIndex.toString(),
      'memberUuid': userId
    };
  }
}
