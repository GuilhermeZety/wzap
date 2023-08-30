import 'package:dio/dio.dart';
import 'package:wzap/core/app_api_path.dart';

class WzapService {
  Future<String?> login({required String email, required String password}) async {
    try {
      var response = await Dio().post(AppApiPath.login, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == null) {
        return null;
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        return response.data['token'];
      }
    } catch (err) {
      print(err);
      return null;
    }
    return null;
  }

  Future<bool> sendMessage({required String message, required String phone, required String token, required String instance}) async {
    try {
      var response = await Dio().post(AppApiPath.send_message,
          data: {
            'instance': instance,
            'message': message,
            'phone_number': phone,
          },
          options: Options(
            headers: {
              'Content-type': 'application/json',
              'Authorization': 'bearer $token',
            },
          ));

      if (response.statusCode == null) {
        return false;
      }

      if (response.statusCode! > 199 && response.statusCode! < 300) {
        return true;
      }
    } catch (err) {
      print(err);
    }
    return false;
  }
}
