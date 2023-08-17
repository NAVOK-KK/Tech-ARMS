import 'package:fast_rsa/fast_rsa.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?> encryptmsg(var message, var pubkey) async {
  var enmsg = await RSA.encryptPKCS1v15(message, pubkey);
  return enmsg;
}

Future<dynamic> dencryptmsg(var message, var prikey) async {
  var denmsg = await RSA.encryptPKCS1v15(message, prikey);
  return denmsg;
}

void generateKey() async {
  try {
    var key = await RSA.generate(2048);
    _addNewItem(key.privateKey, "Private-key");
    _addNewItem(key.publicKey, "Public-Key");

    print(key.privateKey);

    print('13212222222222222222222222222222222');
    print("1111111111111111111111");
    print(key.publicKey);
  } catch (e) {
    // print(e);
  }
}

Future<void> _addNewItem(var v, String s) async {
  const _storage = FlutterSecureStorage();
  await _storage.write(
    key: s,
    value: v,
  );

  // print(v);
}

Future<String?> readItem(String k) async {
  const _storage = FlutterSecureStorage();
  String? value = await _storage.read(
    key: k,
  );

  // print(value);
  // print(value);
//  print(value);
  // print(value);
  // print(value);

  return value;
}
