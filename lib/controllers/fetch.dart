import 'dart:convert';

import 'package:habit_tracker/models/response.dart';
import 'package:http/http.dart' as http;

class Fetch {
  static final Fetch _instance = Fetch._internal();
  static final String _baseUrl =
      'https://habit-tracker-backend.herokuapp.com/api';

  factory Fetch() {
    return _instance;
  }

  Fetch._internal();

  Future<Response> post(Object body, String endpoint) async {
    var response = await http.post('$_baseUrl$endpoint', body: body);

    if (response.statusCode != 200) {
      // Add logs as to why it has failed.
      print(response.statusCode);
      print(response.body);
      return Future.error('error');
    }

    return Future.value(Response(jsonDecode(response.body)));
  }

  Future<Response> get(String endpoint) async {
    var response = await http.get('$_baseUrl$endpoint');

    if (response.statusCode != 200) {
      // Add logs as to why it has failed.
      // return Future.error('error');
      return Future.value(Response({}));
    }

    return Future.value(Response(jsonDecode(response.body)));
  }
}
