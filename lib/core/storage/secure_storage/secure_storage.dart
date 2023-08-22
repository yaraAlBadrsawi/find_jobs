import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../resources/strings_manager.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  // SecureStorage._();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  void writeSecureStorage(var key, var value) async {
    await _storage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }

  Future<String?> readSecureStorage(var key) async {
    String? value =
        await _storage.read(key: key, aOptions: _getAndroidOptions());
    return value;
    // print('value read => ${storage.read(key: ManagerStrings.name)}');
  }

  void deleteSecureStorage(var key) async {
    await _storage.delete(key: key, aOptions: _getAndroidOptions());
  }

  readAllSecureData() async {
    var allData = await _storage.readAll();

    return allData;
  }

  Future<void> deleteAllSecureData() async {
    await _storage.deleteAll(); //aOptions: _getAndroidOptions()
  }
}
