import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUid = 'uid';

  static Future setUid(String uid) async =>
      await _storage.write(key: _keyUid, value: uid);

  static Future<String?> getUid() async => await _storage.read(key: _keyUid);
}

class LocalStorageAdmin {
  static const _storage = FlutterSecureStorage();

  static const _keyUid = 'uid';

  static Future setUidAdmin(String uid) async =>
      await _storage.write(key: _keyUid, value: uid);

  static Future<String?> getUidAdmin() async =>
      await _storage.read(key: _keyUid);
}
