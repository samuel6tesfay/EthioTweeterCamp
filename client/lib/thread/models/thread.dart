class Thread {
  final int? id;
  final String name;
  final String date;
  final String body;
  final String username;

  Thread({this.id, required this.name, this.date = '', required this.username,required this.body});

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
        id: json['id'],
        name: json['name'],
        date: json['date'],
        username: json['username'],
        body: json['body'],
        );
  }
}
