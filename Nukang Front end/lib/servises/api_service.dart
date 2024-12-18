import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tukang_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api';

  static Future<bool> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Tukang>> fetchTukang() async {
    final response = await http.get(Uri.parse('$baseUrl/tukang'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Tukang.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tukang');
    }
  }
}
