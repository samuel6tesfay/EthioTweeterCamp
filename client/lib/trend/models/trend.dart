class Trend {
    final int? id;
    final String body;

  Trend(
      {this.id,
      required this.body});

  factory Trend.fromJson(Map<String, dynamic> json) {
    return Trend(
        id:json['id'],
        body: json['body']
    );
  }
}
