import 'package:auth_with_bloc/core/base/service/auth_service.dart';
import 'package:auth_with_bloc/core/init/network/dio_manager.dart';
import 'package:auth_with_bloc/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/base/bloc/auth_bloc.dart';

void main() {
  runApp(BlocProvider<AuthBloc>(
    create: (_) => AuthBloc(AuthService(DioManager.instance)),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
    );
  }
}
