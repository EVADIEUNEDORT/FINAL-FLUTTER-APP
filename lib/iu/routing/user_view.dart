import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/bloc/auth_bloc.dart';
import 'package:second/bloc/auth_state.dart';
import 'package:second/iu/ui.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.exceptionMessage != "") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.exceptionMessage),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        switch (state) {
          case UserNotFoundState():
            return const SignupPage();
          case UserState():
            return const Tabb();
          default:
            return const SplashIcon();
        }
      },
    );
  }
}
