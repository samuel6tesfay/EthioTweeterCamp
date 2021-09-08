class Thread {
  final int? id;
  final String name;
  final String date;
  final String body;
  final String imagePath;

  Thread(
      { this.id,
      required this.name,
      this.date = '',
      required this.body,
      required this.imagePath});

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
        id: json['id'],
        name: json['name'],
        date: json['date'],
        body: json['body'],
        imagePath: json['imagepath']);
  }
}
