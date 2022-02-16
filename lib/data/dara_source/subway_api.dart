import 'dart:convert';

import 'package:http/http.dart' as http;

class SubwayApi {
  final http.Client client;

  SubwayApi(this.client);

  static const baseUrl = 'http://swopenapi.seoul.go.kr/api/';

  Future<Iterable> fetch(String query) async {
    try {
      final response = await client.get(
        Uri.parse(
            '${baseUrl}subway/sample/json/realtimeStationArrival/0/5/$query'),
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['realtimeArrivalList'];
      return hits;
    } catch (e) {
      return throw Exception('Failed to load subway info');
    }
  }
}
