import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/bloc/auth_bloc.dart';
import 'package:second/bloc/auth_event.dart';
import 'package:second/iu/routing/tabb.dart';
import 'package:second/iu/routing/user_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(InitEvent());
    Timer(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const UserView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000A2B),
      body: SplashIcon(),
    );
  }
}

class SplashIcon extends StatelessWidget {
  const SplashIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF000A2B),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200),
          ],
        ),
      ),
    );
  }
}
