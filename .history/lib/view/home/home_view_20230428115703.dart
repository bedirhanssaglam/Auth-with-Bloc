import 'package:auth_with_bloc/core/components/appbar/appbar.dart';
import 'package:auth_with_bloc/core/components/text/custom_text.dart';
import 'package:auth_with_bloc/core/components/textFormField/text_form_field.dart';
import 'package:auth_with_bloc/core/constants/app/color_constants.dart';
import 'package:auth_with_bloc/core/constants/app/string_constants.dart';
import 'package:auth_with_bloc/core/constants/enums/icon_enums.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:auth_with_bloc/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../core/components/button/button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.dynamicHeight(0.07),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          IconEnums.appLogo.iconName.toPng,
                          height: context.dynamicHeight(0.2),
                        ),
                        CustomText(
                          StringConstants.loginTitle,
                          textStyle: context.textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  TextFormFieldWidget(
                    title: "Email",
                    hintText: StringConstants.emailHint,
                  ),
                  TextFormFieldWidget(
                    title: "Password",
                    hintText: StringConstants.passwordHint,
                    isPassword: true,
                  ),
                  CustomButton(
                    buttonText: StringConstants.loginButtonText,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
