import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { id, name, email, password,  loggedIn, code }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> writeString(var key, var value) async {
  await _sharedPreferences.setString(key,value);

  }

  String? readString(var key) {
    return _sharedPreferences.getString(key);
  }





  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}