import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}

class ApiUrls {
  static const String baseUrl =
      'https://urcardm5c3.execute-api.us-west-1.amazonaws.com/dev';

  String fetchAnime = "$baseUrl/fetch-anime";
}
