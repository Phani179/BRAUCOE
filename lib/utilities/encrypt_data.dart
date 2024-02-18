
import 'package:encrypt/encrypt.dart';

class EncryptData
{
  static final key = Key.fromBase64('IH2Wu4pPHluY3l3jrjhxYkvRxvMmJs68+TkCBxukpAg=');
  static final iv = IV.fromBase16('e61bf118e9a88f276e1c2554b8a9c28f');
  static final encrypter = Encrypter(AES(key));

  static String encryptAES(String plainText) {
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decryptAES(String encryptedData) {
    try {
      final encrypted = Encrypted.fromBase64(encryptedData);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);
      return decrypted;
    } catch (e) {
      print('Error decrypting data: $e');
      return ''; // Return empty string or handle error as needed
    }
  }
}
