import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
  }

  Future<void> _init() async {
    final injector = Injector.of(context); //los final son variabldes locales
    final connectivityRepository = injector.connectivityRepository;
    final hasInternet = await connectivityRepository.hasInternet;
    if (hasInternet) {
      final authenticationRepository = injector.authenticationRepository;
      final isSignedIn = await authenticationRepository.isSignedIn;
      if (isSignedIn) {
        final user = await authenticationRepository.guetUserData();
        if (mounted) {
          if (user != null) {
            //home
            _goTo(Routes.home);
          } else {
            //sign in
            _goTo(Routes.signIn);
          }
        }
      } else if (mounted) {
        //verificación mmontada para usar el contexto de navigator con await
        _goTo(Routes.signIn);
      }
    } else {}
  }

  void _goTo(String routename) {
    Navigator.pushReplacementNamed(
      context,
      routename,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
