import 'package:flutter_food_recipe_application/core/app_core_export.dart';

//THIS CLASS THAT SECURELY STORES AND MANAGES THE ENCRPTION KEY.
class SecureEncryptionKeyManager {
  final secureStorage = const FlutterSecureStorage();

  Future<Uint8List?> fetchEncryptedKeyUint8List() async {
    final encryptionKeyString =
        await secureStorage.read(key: CacheKeyEnum.encryptionKey.name);

    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: CacheKeyEnum.encryptionKey.name,
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: CacheKeyEnum.encryptionKey.name);
    if (key == null) {
      return null;
    } else {
      final encryptionKeyUint8List = base64Url.decode(key);
      return encryptionKeyUint8List;
    }
  }
}
