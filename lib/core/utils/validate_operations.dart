import 'package:flutter/foundation.dart' show immutable;

import '../constants/app/string_constants.dart';

@immutable
class ValidateOperations {
  const ValidateOperations._();

  static normalValidation(
    dynamic value,
  ) {
    if (value == null || value.isEmpty) {
      return StringConstants.requiredField;
    }
    return null;
  }

  static emailValidation(dynamic email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (email == null || email.isEmpty || !emailValid) {
      return StringConstants.makeSureCorrectMail;
    }
    return null;
  }
}
