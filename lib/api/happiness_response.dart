class HappinessResponse {
  final int id;
  final String title;
  final String content;
  final int happinessIndex;
  final String memberUuid;

  HappinessResponse(
      this.id, this.title, this.content, this.happinessIndex, this.memberUuid);

  factory HappinessResponse.fromJson(Map<String, dynamic> json) {
    return HappinessResponse(
      json['id'] as int,
      json['title'] as String,
      json['content'] as String,
      json['happinessIndex'] as int,
      json['memberUuid'] as String,
    );
  }
}
