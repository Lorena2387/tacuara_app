import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUid = 'uid';
  static const _keyUserName = 'userName';
  static const _keyUserEmail = 'userEmail';
  static const _keyUserPhoneNumber = 'userPhoneNumber';
  static const _keyUserIsAdmin = 'userIsAdmin';

  static Future setUid(String uid) async =>
      await _storage.write(key: _keyUid, value: uid);

  static Future<String?> getUid() async => await _storage.read(key: _keyUid);

  static Future setUserName(String userName) async =>
      await _storage.write(key: _keyUserName, value: userName);

  static Future<String?> getUserName() async =>
      await _storage.read(key: _keyUserName);

  static Future setUserEmail(String userEmail) async =>
      await _storage.write(key: _keyUserEmail, value: userEmail);

  static Future<String?> getUserEmail() async =>
      await _storage.read(key: _keyUserEmail);

  static Future setUserPhoneNumber(String userPhoneNumber) async =>
      await _storage.write(key: _keyUserPhoneNumber, value: userPhoneNumber);

  static Future<String?> getUserPhoneNumber() async =>
      await _storage.read(key: _keyUserPhoneNumber);

  static Future setUserIsAdmin(String userIsAdmin) async =>
      await _storage.write(key: _keyUserIsAdmin, value: userIsAdmin);

  static Future<String?> getUserIsAdmin() async =>
      await _storage.read(key: _keyUserIsAdmin);
}

class LocalStorageAdmin {
  static const _storage = FlutterSecureStorage();

  static const _keyUid = 'uid';

  static Future setUidAdmin(String uid) async =>
      await _storage.write(key: _keyUid, value: uid);

  static Future<String?> getUidAdmin() async =>
      await _storage.read(key: _keyUid);
}
