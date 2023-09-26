import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../config/constants.dart';
import '../../../model/user.dart';

class HiveService {
  late Box<dynamic> _userBox = Hive.box(Constants.userBox);
  late Box<dynamic> _isLoggedBox = Hive.box(Constants.isLoggedBox);

  Future<void> initHive() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox(Constants.userBox);
    _isLoggedBox = await Hive.openBox(Constants.isLoggedBox);
  }

  Future isUserLogged(var key, bool value) async {
    await _isLoggedBox.put(key, value);
  }

  getLoginStatus(var key) {
    var value = _isLoggedBox.get(key);
    return value;
  }

  Future addItem(var key, var value) async {
    print('you in ADD ITEM function ');

    await _userBox.put(key, value);

  }

  getItem(var key) {
    var value = _userBox.get(key);
    return value;
  }

  deleteItem(var value) {
    _userBox.delete(value);
  }
}
