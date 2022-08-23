class HappinessRequest {
  final String title;
  final String content;
  final int happinessIndex;
  final String memberUuid;

  HappinessRequest(
      this.title, this.content, this.happinessIndex, this.memberUuid);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'happinessIndex': happinessIndex,
      'memberUuid': memberUuid,
    };
  }
}
