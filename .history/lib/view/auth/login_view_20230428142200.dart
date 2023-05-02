import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:auth_with_bloc/core/components/appbar/appbar.dart';
import 'package:auth_with_bloc/core/components/text/custom_text.dart';
import 'package:auth_with_bloc/core/components/textFormField/text_form_field.dart';
import 'package:auth_with_bloc/core/constants/app/string_constants.dart';
import 'package:auth_with_bloc/core/constants/enums/icon_enums.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:auth_with_bloc/core/extensions/num_extensions.dart';
import 'package:auth_with_bloc/core/utils/validate_operations.dart';

import '../../core/base/bloc/auth_bloc.dart';
import '../../core/components/button/button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool get validate => _formKey.currentState!.validate();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.05),
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.dynamicHeight(0.06),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          IconEnums.appLogo.iconName.toPng,
                          height: context.dynamicHeight(0.2),
                        ),
                        30.ph,
                        CustomText(
                          StringConstants.loginTitle,
                          textStyle: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  TextFormFieldWidget(
                    controller: emailController,
                    title: "Email",
                    hintText: StringConstants.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                    validator: (value) =>
                        ValidateOperations.emailValidation(value),
                  ),
                  TextFormFieldWidget(
                    controller: passwordController,
                    title: "Password",
                    hintText: StringConstants.passwordHint,
                    isPassword: true,
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    validator: (value) =>
                        ValidateOperations.normalValidation(value),
                  ),
                  CustomButton(
                    buttonText: StringConstants.loginButtonText,
                    onTap: () {
                      if (validate) {
                        log(emailController.text);
                        log(passwordController.text);
                      } else {
                        log("null");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}