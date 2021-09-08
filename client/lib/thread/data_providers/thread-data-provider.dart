import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class ThreadDataProvider {
  static final String _baseUrl = "http://10.0.2.2:9191/api/v1/threads";

  Future<Thread> create(Thread thread) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "code": thread.code,
          "title": thread.title,
          "ects": thread.ects,
          "description": thread.description
        }));

    if (response.statusCode == 201) {
      return Thread.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create course");
    }
  }

  Future<Thread> fetchByCode() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return Thread.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching Thread by code failed");
    }
  }

  Future<List<Thread>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final threads = jsonDecode(response.body) as List;
      return threads.map((c) => Thread.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch threads");
    }
  }

  Future<Thread> update(int id, Thread thread) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "code": thread.code,
          "title": thread.title,
          "ects": thread.ects,
          "description": thread.description
        }));

    if (response.statusCode == 200) {
      return Thread.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the thread");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the thread");
    }
  }
}
