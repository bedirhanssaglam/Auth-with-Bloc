import 'dart:async';

import 'package:auth_with_bloc/core/constants/enums/icon_enums.dart';
import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:auth_with_bloc/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base/bloc/auth_bloc.dart';
import '../../core/constants/enums/auth_enums.dart';
import '../home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>()..add(AppStarted());
    authStream = authBloc.stream.listen((state) {
      if (state.status == AuthStatus.authenticated) {
        Future.delayed(const Duration(seconds: 2)).then(
          (value) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          ),
        );
      } else {
        Future.delayed(const Duration(seconds: 2)).then(
          (value) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    authStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(IconEnums.appLogo.iconName.toPng),
      ),
    );
  }
}
