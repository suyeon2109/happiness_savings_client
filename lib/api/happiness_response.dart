class HappinessResponse {
  final int id;
  final String title;
  final String content;
  final int happinessIndex;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final String imageUrl;


  HappinessResponse(this.id, this.title, this.content, this.happinessIndex,
      this.createdAt, this.updatedAt, this.userId, this.imageUrl);

  factory HappinessResponse.fromJson(Map<String, dynamic> json) {
    return HappinessResponse(
      json['id'] as int,
      json['title'] as String,
      json['content'] as String,
      json['happinessIndex'] as int,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['userId'] as String,
      json['imageUrl'] as String,
    );
  }

  @override
  String toString() {
    return 'HappinessResponse{id: $id, title: $title, content: $content, happinessIndex: $happinessIndex, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, imageUrl: $imageUrl}';
  }
}
