class Thread {
  final int? id;
  final String code;
  final String title;
  final int ects;
  final String? description;

  Thread(
      {required this.id,
      required this.code,
      required this.title,
      required this.ects,
      this.description});

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
        id: json['id'],
        code: json['code'],
        title: json['title'],
        ects: json['ects'],
        description: json['description']);
  }
}
