import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas_multiplatform/models/user_models.dart';

class ApiServices {
  final String _baseUrl = "https://reqres.in/api";

  final String _usersEndpoint = "/users?page=2";

  final String _apiKey = "reqres-free-v1";

  Future<List<UserData>> fetchUsers() async {
    final response = await http
        .get(
          Uri.parse('$_baseUrl$_usersEndpoint'),
          headers: {'Accept': 'application/json', 'x-api-key': _apiKey},
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['data'] as List).map((json) => UserData.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat pengguna: Status ${response.statusCode}');
    }
  }
}