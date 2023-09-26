import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

class FieldValidator {
  //TODO :delete static and make instance of class in controller
  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return StringsManager.emptyEmail;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return StringsManager.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      return StringsManager.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return StringsManager.emptyPassword;
    }

    if (password.length < 8) {
      return StringsManager.shortPassword;
    }

    // Check if the password contains at least one letter
    RegExp letterRegExp = RegExp(r'[a-zA-Z]');
    if (!letterRegExp.hasMatch(password)) {
      return StringsManager.passwordNeedsLetter;
    }

    return null;
  }

  static String? validateName(String? fullName) {
    if (fullName!.isEmpty) {
      return StringsManager.requiredName;
    }
    if (fullName.length < 3) {
      return StringsManager.tooShort;
    }

    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone!.isEmpty) {
      return StringsManager.requiredPhone;
    }

    if (!GetUtils.isPhoneNumber(phone)) {
      return StringsManager.invalidMobileNumber;
    }

    return null;
  }

  static String? validateData(value) {
    if (value == null) {
      return StringsManager.dataCantBeEmpty;
    }
    return null;
  }

  static String? validateAbout(value) {
    if (value == null) {
      return StringsManager.dataCantBeEmpty;
    }
    if (value.toString().length < 150) {
      return StringsManager.writeMore;
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
