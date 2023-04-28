import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/icon_enums.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with BaseSingleton {
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
            height: context.dynamicHeight(0.04),
            width: context.dynamicWidth(0.08),
          ),
          5.pw,
          Text(
            constants.appName,
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
