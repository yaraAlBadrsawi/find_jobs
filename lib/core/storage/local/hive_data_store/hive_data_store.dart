import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../config/constants.dart';
import '../../../model/user.dart';

class HiveService {
  late HiveService _hiveService;

  static final HiveService _instance = HiveService._();

  HiveService._();

  factory HiveService() {
    return _instance;
  }

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
    // await _userBox.add(newItem);
    await _userBox.put(key, value);
    // print('data is => ${userBox.length}');
    // print('USER BOX  => ${userBox}');
  }

  getItem(var key) {
    var value = _userBox.get(key);
    return value;
  }

  deleteItem(var value) {
    _userBox.delete(value);
  }

//   final myBox = Hive.box(userBox);
//
//   Box<UserModel> get _box => Hive.box<UserModel>(userBox);
//   ValueNotifier<List<UserModel>> dataListNotifier = ValueNotifier([]);
//   Future<Box<UserModel>> get _database => Hive.openBox<UserModel>(userBox);
//
//
//
//   /// Add new Task
//   Future<void> addUser({required var key,required UserModel userModel}) async {
//
//
//     // if (key == null) {
//     //   _addData(userModel);
//     //   return;
//     // }
//     // _updateData(model, key);
//     getAllData();
//   }
//    //   await myBox.put(StringsManager.user, userModel);
//
//
// Future<void> getAllData() async {
//   final database = await _database;
//   dataListNotifier.value = database.values.toList();
// }
//
//   Future<void> _addData(UserModel model) async {
//     final database = await _database;
//     await database.add(model);
//     getAllData();
//   }
//
//   /// Show task
//   Future<UserModel?> getUser({required String key}) async {
//     // final userBox = Hive.box<UserModel>(_userBoxName);
//
//     return myBox.get(key);
//   }
//
}
