import 'package:flutter/foundation.dart' show immutable;

@immutable
class ValidatorHelpers {
  const ValidatorHelpers._();

  static validateOperation(dynamic value, String errorMessage,
      {int minCharacterCount = 0}) {
    if (value == null || value.isEmpty || value.length < minCharacterCount) {
      return errorMessage;
    }
    return null;
  }

  emailValidateOperation(dynamic email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (email == null || email.isEmpty || !emailValid) {
      return "Please make sure you enter the correct email.";
    }
    return null;
  }
}
