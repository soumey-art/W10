class Score {
  final String title;
  final int score; // on 100
  final int userId;

  Score({required this.title, required this.score, required this.userId});

  static Score fromJSon(Map<String, dynamic> json) {
    return Score(userId: json["userId"], title: json["title"], score: json["score"]);
  }
}
