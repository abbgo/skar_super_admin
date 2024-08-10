import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiUrl = dotenv.env['API_URL']!;
String pathUrl = dotenv.env['PATH_URL']!;

Map<String, String>? tokenHeader(String accessToken) {
  return {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json'
  };
}
