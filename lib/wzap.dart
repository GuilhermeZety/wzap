import 'package:wzap/wzap.dart';

export 'src/wzap_messager.dart';
export 'src/wzap_service.dart';

main() async {
  try {
    await WzapMessager().configure(
      instance: 'WZP5547992572818',
      email: 'relacionamento@w2o.com.br',
      password: 'password',
    );
    await WzapMessager().sendMessage(message: 'salve', phone: '5547992452912');
  } catch (e) {
    print(e);
  }
}

class MessagerService {
  static Future setInstance() async {
    await WzapMessager().configure(
      instance: 'WZP5547992572818',
      email: 'relacionamento@w2o.com.br',
      password: 'password',
    );
  }
}
