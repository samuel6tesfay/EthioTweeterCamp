class MostRelevantPeople {
  final int? id;
  final String name;

  MostRelevantPeople(
      { this.id,
      required this.name});

  factory MostRelevantPeople.fromJson(Map<String, dynamic> json) {
    return MostRelevantPeople(
        id: json['id'],
        name: json['name']);
  }
}
