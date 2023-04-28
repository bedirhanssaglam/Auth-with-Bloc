import 'dart:async';

import 'package:auth_with_bloc/core/base/service/auth_service.dart';
import 'package:auth_with_bloc/core/constants/app/string_constants.dart';
import 'package:auth_with_bloc/core/init/network/dio_manager.dart';
import 'package:auth_with_bloc/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/base/bloc/auth_bloc.dart';

void main() {
  runApp(
    BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(AuthService(DioManager.instance)),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = true;
  late final AuthBloc authBloc;
  late StreamSubscription authStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      home: LoginView(),
    );
  }
}
