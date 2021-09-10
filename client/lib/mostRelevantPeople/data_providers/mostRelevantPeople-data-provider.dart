import 'dart:convert';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class MostRelevantPeopleDataProvider {
  static final String _baseUrl = "http://10.0.2.2:9191/api/v1/threads";

  Future<MostRelevantPeople> create(MostRelevantPeople mostRelevantPeople) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "body": mostRelevantPeople.body,
          "imagePath": mostRelevantPeople.imagePath
        }));

    if (response.statusCode == 201) {
      return MostRelevantPeople.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create mostRelevantPeople");
    }
  }

  Future<MostRelevantPeople> fetchByCode() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return MostRelevantPeople.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching mostRelevantPeople  failed");
    }
  }

  Future<List<MostRelevantPeople>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final mostRelevantPeoples = jsonDecode(response.body) as List;
      return mostRelevantPeoples.map((c) => MostRelevantPeople.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch mostRelevantPeoples");
    }
  }

  Future<MostRelevantPeople> update(int id, MostRelevantPeople mostRelevantPeople) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "body": mostRelevantPeople.body,
          "imagePath": mostRelevantPeople.imagePath
        }));

    if (response.statusCode == 200) {
      return MostRelevantPeople.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the mostRelevantPeople");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the mostRelevantPeople");
    }
  }
}
