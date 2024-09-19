import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' show log;

class ApiRegister {
  Future<Map<String, dynamic>> signUp(
      String name, String email, String password) async {
    final url = Uri.parse('https://testbi.glotelho.cm/api/new/purchase-agent');
    final headers = {'Content-Type': 'application/json'};
    final body =
        jsonEncode({'name': name, 'email': email, 'password': password});

    final response = await http.post(url, headers: headers, body: body);
    log(response.body);
    //slog(response.statusCode.toString());
    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {'success': true, 'access_token': responseData['access_token']};
    } else {
      return {'success': false, 'message': 'Failed to create account'};
    }
  }
}

class ApiLogin {
  final String _baseUrl = 'https://testbi.glotelho.cm';
  final storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    log(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['success']) {
        await storage.write(
            key: 'access_token', value: responseData['access_token']);
      }
      return responseData;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'access_token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'access_token');
  }
}
