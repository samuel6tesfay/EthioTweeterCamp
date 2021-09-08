class MostRelevantPeople {
  final int? id;
  final String body;
  final String imagePath;

  MostRelevantPeople(
      { this.id,
      required this.body,
      required this.imagePath});

  factory MostRelevantPeople.fromJson(Map<String, dynamic> json) {
    return MostRelevantPeople(
        id: json['id'],
        body: json['body'],
        imagePath: json['imagepath']);
  }
}
