import 'package:auth_with_bloc/core/components/appbar/appbar.dart';
import 'package:auth_with_bloc/core/components/text/custom_text.dart';
import 'package:auth_with_bloc/core/components/textFormField/text_form_field.dart';
import 'package:auth_with_bloc/core/constants/app/color_constants.dart';
import 'package:auth_with_bloc/core/constants/app/string_constants.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

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
                  TextFormFieldWidget(
                    title: "Email",
                    hintText: StringConstants.emailHint,
                  ),
                  TextFormFieldWidget(
                    title: "Password",
                    hintText: StringConstants.passwordHint,
                    isPassword: true,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.teal,
                        fixedSize: Size(
                          context.dynamicWidth(1),
                          context.dynamicHeight(0.06),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    child: CustomText(
                      "LOGIN",
                      textStyle: context.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
