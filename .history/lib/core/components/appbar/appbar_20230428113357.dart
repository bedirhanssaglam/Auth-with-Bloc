import 'package:auth_with_bloc/core/components/text/custom_text.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:auth_with_bloc/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/app/string_constants.dart';
import '../../constants/enums/icon_enums.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            IconEnums.appLogo.iconName.toPng,
            height: context.dynamicHeight(0.03),
            width: context.dynamicWidth(0.06),
          ),
          5.pw,
          CustomText(
            StringConstants.appName,
            textStyle: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
