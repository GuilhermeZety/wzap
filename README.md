# wzap

[![pub package](https://img.shields.io/pub/v/wzap.svg)](https://pub.dartlang.org/packages/wzap)

A reactive key-value store for Flutter projects.

**wzap** biblioteca simples de integração com o wzap da W2O para enviar mensagens para o whatsapp de maneira simplificada.

## Getting started
Primeiro, adicione o wzap ao seu pubspec.yaml.


**Mude a url do repositório conforme o seu usuário e acesso ao bitbucket "Guilherme_Martins_w2o" é o meu usuário, adicione o seu respectivo**
```yaml
dependencies:
  wzap:
    git:
      url: https://Guilherme_Martins_w2o@bitbucket.org/time-w2o/wzap-flutter-package.git
      ref: master
```


Primeiro é necessario instanciar o projeto com as configurações para integrar com o whatsapp, então adicione em seu main:



```dart

main() async {
    ...

    // Será retornado se houve sucesso ou não
    var success = await WzapMessager().configure(
        instance: 'sua instancia',
        email: 'seu email de acesso',
        password: 'sua senha de acesso',
    );

  ...
}
```

Após configurações feitas é só começar a utilizar;

Segue o exemplo de uso:

```dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:zrepository/zrepository.dart';

void main() async {
  await sendMessage();
}


void sendMessage(){
    var success = await WzapMessager().configure(
        instance: 'sua instancia',
        email: 'seu email de acesso',
        password: 'sua senha de acesso',
    );
    if(sucess){
        // não é necessário adicionar o + na frente do 55
        await WzapMessager().sendMessage(message: 'Testando 123', phone: '5547999999999');
    }
}
```

Hope you like it!
