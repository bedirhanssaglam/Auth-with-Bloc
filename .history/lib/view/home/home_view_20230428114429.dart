import 'package:auth_with_bloc/core/components/appbar/appbar.dart';
import 'package:auth_with_bloc/core/components/text/custom_text.dart';
import 'package:auth_with_bloc/core/components/textFormField/text_form_field.dart';
import 'package:auth_with_bloc/core/constants/app/string_constants.dart';
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
                ElevatedButton(onPressed: () {}, child: CustomText("LOGIN")),
              ],
            ),
          ),
        ));
  }
}
