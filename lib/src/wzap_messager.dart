// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wzap/src/wzap_service.dart';

class WzapConfiguration {
  String? token;
  String? instance;
  final String email;
  final String password;

  WzapConfiguration({
    this.token,
    this.instance,
    required this.email,
    required this.password,
  });
}

class WzapMessager {
  WzapMessager._();
  static final WzapMessager _instance = WzapMessager._();
  factory WzapMessager() => WzapMessager._instance;
  /////////////////////////////////
  WzapService service = WzapService();
  WzapConfiguration? configuration;

  Future<bool> configure({required String instance, required String email, required String password}) async {
    var response = await service.login(email: email, password: password);

    if (response != null) {
      configuration = WzapConfiguration(
        token: response,
        instance: instance,
        email: email,
        password: password,
      );
      return true;
    }
    return false;
  }

  Future<bool> sendMessage({required String message, required String phone}) async {
    if (configuration != null) {
      return await service.sendMessage(
        token: configuration!.token!,
        instance: configuration!.instance!,
        message: message,
        phone: phone,
      );
    }
    return false;
  }
}
