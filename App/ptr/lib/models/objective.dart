class Objective {
  final int id;
  final String title;
  final int points;
  final String description;
  Objective(
      {required this.id,
      required this.title,
      required this.points,
      required this.description});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'points': points,
      'description': description,
    };
  }
}
