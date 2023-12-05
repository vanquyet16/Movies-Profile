import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_profile/models/user.dart';

enum AuthAction { login, register }

class Api {
  static Future<Map<String, dynamic>> submitData(
      User user, AuthAction action) async {
    final body = user.toJson();
    String url;
    String baseLink = "http://127.0.0.1:3002";
    if (action == AuthAction.login) {
      url = '$baseLink/dangnhap';
    } else if (action == AuthAction.register) {
      url = '$baseLink/api/themTaiKhoan'; // Thay đổi URL cho đăng ký
    } else {
      throw Exception('Invalid AuthAction');
    }

    final uri = Uri.parse(url);
    try {
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print("Success");
        Map<String, dynamic> pathData = jsonDecode(response.body);
        return pathData; // Returning the response body as a string
      } else {
        print('Error Status Code: ${response.statusCode}');
        print('Error Response Body: ${response.body}');
        throw Exception('Failed to submit data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to submit data');
    }
  }
}
