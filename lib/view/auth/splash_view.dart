import 'dart:async';

import 'package:auth_with_bloc/core/constants/enums/icon_enums.dart';
import 'package:auth_with_bloc/core/extensions/context_extensions.dart';
import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:auth_with_bloc/core/extensions/navigate_extension.dart';
import 'package:auth_with_bloc/core/utils/navigate_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base/bloc/auth_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>()..add(AppStarted());

    /// For [animation]
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    authStream = authBloc.stream.listen((state) {
      Future.delayed(const Duration(seconds: 2)).then((_) =>
          NavigateUtil().navigateToView(context, state.status.firstView));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotationTransition(
        turns: _animation,
        child: Center(
          child: Image.asset(
            IconEnums.appLogo.iconName.toPng,
            height: context.dynamicHeight(0.2),
            width: context.dynamicWidth(0.9),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    authStream.cancel();
    _controller.dispose();
    super.dispose();
  }
}
