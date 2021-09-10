import 'dart:convert';

import '../models/models.dart';

import 'package:http/http.dart' as http;

class ThreadDataProvider {
  static final String _baseUrl = "http://localhost:5000/";

  Future<Thread> create(Thread thread) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl+"thread"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "name": thread.name,
          "username": thread.username,
          "body": thread.body,
        }));

    if (response.statusCode == 201) {
      return Thread.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create thread");
    }
  }

  Future<Thread> fetchByCode() async {
    final response = await http.get(Uri.parse(_baseUrl + "threads"));

    if (response.statusCode == 200) {
      return Thread.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching Thread by code failed");
    }
  }

  Future<List<Thread>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl + "threads"));
    if (response.statusCode == 200) {
      final threads = jsonDecode(response.body) as List;
      return threads.map((c) => Thread.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch threads");
    }
  }

  Future<Thread> update(int id, Thread thread) async {
    final response = await http.put(Uri.parse(_baseUrl+"thread/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "name": thread.name,
          "username": thread.username,
          "body": thread.body,
        }));

    if (response.statusCode == 200) {
      return Thread.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the thread");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse(_baseUrl+"thread/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the thread");
    }
  }
}
