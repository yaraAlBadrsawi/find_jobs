import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../resources/strings_manager.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  void writeSecureStorage(var key, var value) async {
    await _storage.write(key: key, value: value);
  }

  Future readSecureStorage(var key) async {
    await _storage.read(key: key) ?? StringsManager.noDataFound;
    return _storage.read(key: key);
    // print('value read => ${storage.read(key: ManagerStrings.name)}');
  }

  void deleteSecureStorage(var key) async {
    await _storage.delete(key: key);
  }
}
