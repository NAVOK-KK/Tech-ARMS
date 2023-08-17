// import 'package:encrypt/encrypt.dart';

// // class RsaEncryption {
// //    final  String texte;

// //   RsaEncryption(this.texte);

// //   String RSAEncryption() {
// //     // const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
// //     final key = Key.fromUtf8('my 32 length key................');
// //     final iv = IV.fromLength(16);

// //     final encrypter = Encrypter(AES(key));

// //     final encrypted = encrypter.encrypt(texte, iv: iv);
// //     //final decrypted = encrypter.decrypt(encrypted, iv: iv);

// //     // ignore: avoid_print
// //     // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
// //     // ignore: avoid_print
// //     // print(encrypted.base64);
// //     return encrypted
// //         .base64; // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
// //   }

// //   String RSADecryption(Encrypted s) {
// //    // final Encrypted s;
// //     // const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
// //     final key = Key.fromUtf8('my 32 length key................');
// //     final iv = IV.fromLength(16);  final encrypter = Encrypter(AES(key));

// //     final decrypted = encrypter.decrypt(s, iv: iv);

// //     // ignore: avoid_print
// //     // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
// //     // ignore: avoid_print
// //     // print(encrypted.base64);
// //     return decrypted; // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
// //   }
// // }

// // String RSAEncryption(String texte) {
// //   const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
// //   final key = Key.fromUtf8('my 32 length key................');
// //   final iv = IV.fromLength(16);

// //   final encrypter = Encrypter(AES(key));

// //   final encrypted = encrypter.encrypt(plainText, iv: iv);
// //   final decrypted = encrypter.decrypt(encrypted, iv: iv);

// //   // ignore: avoid_print
// //   print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
// //   // ignore: avoid_print
// //   print(encrypted.base64);
// //   return encrypted
// //       .base64; // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
// // }

// String rSAEncryption(String texte) {
//   // const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
//   final key = Key.fromUtf8('my 32 length key................');
//   final iv = IV.fromLength(16);

//   final encrypter = Encrypter(AES(key));

//   final encrypted = encrypter.encrypt(texte, iv: iv);
//   //final decrypted = encrypter.decrypt(encrypted, iv: iv);

//   // ignore: avoid_print
//   // print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
//   // ignore: avoid_print
//   // print(encrypted.base64);
//   return encrypted.base64
//       .toString(); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
// }
