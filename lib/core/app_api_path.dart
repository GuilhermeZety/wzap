// ignore_for_file: non_constant_identifier_names

import 'package:dotenv/dotenv.dart';

class AppApiPath {
  static String get login {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    return '${env['API']}/login';
  }

  static String get send_message {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    return '${env['API']}/whatsapp/send-message';
  }
}
