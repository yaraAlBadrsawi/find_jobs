import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../presentation/resource/strings_manager.dart';

class FieldValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return StringsManager.invalidEmail;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return StringsManager.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      return StringsManager.invalidEmail;
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return StringsManager.invalidPassword;
    }

    if (password.length < 8) {
      return StringsManager.invalidPassword;
    }

    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName!.isEmpty) {
      return StringsManager.requiredFullName;

    }

    return null;
  }

  String? validatePhone(String? phone) {
    if (phone!.isEmpty) {
      return StringsManager.requiredPhone;
    }

    if (!GetUtils.isPhoneNumber(phone)) {
      return StringsManager.invalidEmail;
    }

    return null;
  }

  String? validateCode(value) {
    if (value == null || value.trim().isEmpty) {
      return StringsManager.invalidEmptyCode;
    }
    return null;
  }
}
