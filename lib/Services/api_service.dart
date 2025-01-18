import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your Flask API base URL
  static const String baseUrl = 'http://10.0.2.2:5000/api';

  // Example: Register user
  static Future<Map<String, dynamic>> registerUser({
    required String email,
    required String fullName,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
        "full_name": fullName,
        "password": password,
      }),
    );

    if (response.statusCode == 201) {
      // Registration successful
      return jsonDecode(response.body);
    } else {
      // Registration failed; parse error message
      throw Exception(jsonDecode(response.body)['error'] ?? 'Registration error');
    }
  }

  // Example: Login user
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful
      return jsonDecode(response.body);
    } else {
      // Login failed
      throw Exception(jsonDecode(response.body)['error'] ?? 'Login error');
    }
  }
}
