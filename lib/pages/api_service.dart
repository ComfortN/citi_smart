import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.chenosis.io/botlhale/translate/getTranslation';
  final String _tokenUrl = 'https://api.chenosis.io/oauth/client/accesstoken?grant_type=client_credentials';

  String? _accessToken;

  Future<void> _fetchAccessToken() async {
  final response = await http.post(
    Uri.parse(_tokenUrl),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'grant_type': 'client_credentials',
      'client_id': 'hT05Z4gQ6TwSjc4qaUw2HnQiGxQWqxRI',
      'client_secret': 'tGyPGiFAo7AwN4l5', 
    },
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    _accessToken = responseData['access_token'];
  } else {
    throw Exception('Failed to fetch access token: ${response.reasonPhrase}');
  }
    }

  Future<Map<String, dynamic>> getTranslation({
    required String text,
    required String languageCode,
    required String targetCode,
    required String translateId,
    required String orgId,
  }) async {
    if (_accessToken == null) {
      await _fetchAccessToken();
    }

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_accessToken',
      },
      body: jsonEncode({
        'Text': text,
        'LanguageCode': languageCode,
        'TargetCode': targetCode,
        'TranslateID': translateId,
        'OrgID': orgId,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load translation');
    }
  }


