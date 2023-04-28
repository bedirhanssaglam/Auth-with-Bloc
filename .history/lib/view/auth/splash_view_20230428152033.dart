import 'package:auth_with_bloc/core/constants/enums/icon_enums.dart';
import 'package:auth_with_bloc/core/extensions/image_extensions.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    @override
    void initState() {
      super.initState();
      authBloc = context.read<AuthBloc>()..add(AppStarted());
      authStream = authBloc.stream.listen((state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        } else {}
      });
    }

    @override
    void dispose() {
      super.dispose();
      authStream.cancel();
    }
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
