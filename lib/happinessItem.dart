class Happiness {
  String? title;
  String? content;
  int? happinessIndex;
  String? createdAt;
  String? updatedAt;
  String? imagePath;


  Happiness(
      {this.title,
        this.content,
        this.happinessIndex,
        this.createdAt,
        this.imagePath});

  @override
  String toString() {
    return 'Happiness{title: $title, content: $content, happinessIndex: $happinessIndex, imagePath: $imagePath}';
  }
}
