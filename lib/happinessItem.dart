

class Happiness {
  String? title;
  String? content;
  int? happinessIndex;
  String date;

  Happiness(
      {this.title,
       this.content,
       this.happinessIndex,
        required this.date});

  @override
  String toString() {
    return 'Happiness{title: $title, content: $content, happinessIndex: $happinessIndex, date: $date}';
  }
}