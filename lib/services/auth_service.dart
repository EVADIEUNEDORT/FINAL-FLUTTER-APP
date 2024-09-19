import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:second/iu/views/views.dart';
import 'package:second/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = const FlutterSecureStorage();

  // Future<User> login(String email, String password) async {
  //   final url =
  //       Uri.parse('https://testbi.glotelho.cm/api/new/purchase-agent/login');
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = jsonEncode({'email': email, 'password': password});

  //   final response = await http.post(url, headers: headers, body: body);

  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     await storage.write(
  //         key: 'access_token', value: responseData['access_token']);
  //     return User(id: responseData['id'], email: email);
  //   } else {
  //     throw Exception('Email ou mot de passe incorrect');
  //   }
  // }
  Future<Map<String, dynamic>?> loginPage(String email, String password) async {
    final url = Uri.https('testbi.glotelho.cm', '/api/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Error during login request ${response.statusCode}');
      }
    } on Exception catch (e) {
      log('Exception during login $e');
      return null;
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'access_token');
  }

  Future<Map<String, dynamic>?> signUp(
      String name, String email, String password) async {
    final url = Uri.https('testbi.glotelho.cm', '/api/new/purchase-agent');
    final headers = {'Content-Type': 'application/json'};
    final body =
        jsonEncode({'name': name, 'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Error during sign up request ${response.statusCode}');
      }
    } on Exception catch (e) {
      log('Exception during sign up $e');
      return null;
    }
  }

  Future<void> logout?() async {
    await storage.delete(key: 'access_token');
  }
}
