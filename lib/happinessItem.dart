

class Happiness {
  String? title;
  String? content;
  int? happinessIndex;
  String date;

  Happiness(
      {required this.title,
        required this.content,
        required this.happinessIndex,
        required this.date});

  @override
  String toString() {
    return 'Happiness{title: $title, content: $content, happinessIndex: $happinessIndex, date: $date}';
  }
}