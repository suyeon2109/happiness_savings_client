class Happiness {
  String? title;
  String? content;
  int? happinessIndex;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  Happiness(
      {required this.title,
        required this.content,
        required this.happinessIndex,
        this.createdAt,
        this.imagePath});

  @override
  String toString() {
    return 'Happiness{title: $title, content: $content, happinessIndex: $happinessIndex, imagePath: $imagePath}';
  }
}
