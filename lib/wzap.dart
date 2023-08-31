import 'package:wzap/src/wzap_messager.dart';

export 'src/wzap_messager.dart';
export 'src/wzap_service.dart';

main() async {
  await WzapMessager().configure(
    instance: 'WZP5547992572818',
    email: 'relacionamento@w2o.com.br',
    password: 'password',
  );
  await WzapMessager().sendMessage(
    message: 'Teste2',
    phone: '5547992452912',
  );
}
