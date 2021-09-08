import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class TrendDataProvider {
  static final String _baseUrl = "http://10.0.2.2:9191/api/v1/trends";

  Future<Trend> create(Trend trend) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "body": trend.body,
        }));

    if (response.statusCode == 201) {
      return Trend.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create trend");
    }
  }

  Future<Trend> fetchByCode() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return Trend.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching Trend  failed");
    }
  }

  Future<List<Trend>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final trends = jsonDecode(response.body) as List;
      return trends.map((c) => Trend.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch trends");
    }
  }

  Future<Trend> update(int id, Trend trend) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "body": trend.body,
        }));

    if (response.statusCode == 200) {
      return Trend.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the trend");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the trend");
    }
  }
}
