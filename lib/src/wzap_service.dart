import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wzap/core/app_api_path.dart';

class WzapService {
  Future<String?> login({required String email, required String password}) async {
    try {
      var response = await http.post(
        Uri.parse(AppApiPath.login),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode > 199 && response.statusCode < 300) {
        return jsonDecode(response.body)['token'];
      }
    } catch (err) {
      print(err);
      return null;
    }
    return null;
  }

  Future<bool> sendMessage({required String message, required String phone, required String token, required String instance}) async {
    try {
      var response = await http.post(Uri.parse(AppApiPath.send_message), body: {
        'instance': instance,
        'message': message,
        'phone_number': phone,
      }, headers: {
        'Authorization': 'bearer $token',
      });

      if (response.statusCode > 199 && response.statusCode < 300) {
        return true;
      }
    } catch (err) {
      print(err);
    }
    return false;
  }
}
