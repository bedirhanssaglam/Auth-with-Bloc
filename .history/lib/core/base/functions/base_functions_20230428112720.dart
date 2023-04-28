import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/app/color_constants.dart';

class BaseFunctions {
  static BaseFunctions? _instance;
  static BaseFunctions get instance {
    _instance ??= BaseFunctions._init();
    return _instance!;
  }

  BaseFunctions._init();

  Widget platformIndicator() {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(color: ColorConstants.instance.mainColor)
          : CircularProgressIndicator(color: ColorConstants.instance.mainColor),
    );
  }

  Widget errorText(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  closePopup(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
