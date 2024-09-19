import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/bloc/auth_event.dart';
import 'package:second/bloc/auth_state.dart';
import 'package:second/constants/constants.dart';
import 'package:second/models/user.dart';
import 'package:second/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  User? user;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<InitEvent>((event, emit) async {
      try {
        final rawUser = await fromSharedPreference('user');
        if (rawUser != null) {
          final mapUser = jsonDecode(rawUser);
          user = User.fromJson(mapUser);
          emit(UserState(user: user));
        } else {
          emit(const UserNotFoundState());
        }
      } on Exception catch (e) {
        log('Error getting user $e');
        emit(const UserNotFoundState());
      }
    });

    on<AuthLoginRequested>((event, emit) async {
      emit(const UserNotFoundState(loading: true));
      try {
        final response =
            await authService.loginPage( event.email, event.password);
        if (response != null) {
          if (response['success']) {
            user = User(
                accessToken: response['access_token'],
              email: event.email);
            toSharedPreference('user', user.toString());
            emit(const UserNotFoundState(loading: false));
            emit(UserState(user: user));
          } else {
            emit(const UserNotFoundState(loading: false, exceptionMessage: 'Veuillez verifier vos informations et reessayer'));
          }
        }
      } on Exception catch (e) {
        log('Error signing up $e');
      }
    });

on<AuthSignUpRequested>((event, emit) async {
      emit(const UserNotFoundState(loading: true));
      try {
        final response =
            await authService.signUp(event.name, event.email, event.password);
        if (response != null) {
          if (response['success']) {
            user = User(
                accessToken: response['access_token'],
                name: event.name,
                email: event.email);
            toSharedPreference('user', user.toString());
            emit(const UserNotFoundState(loading: false));
            emit(UserState(user: user));
          } else {
            emit(const UserNotFoundState(loading: false, exceptionMessage: 'Veuillez verifier vos informations et reessayer'));
          }
        }
      } on Exception catch (e) {
        log('Error signing up $e');
      }
    });

  }
  



  



  // @override
  // Stream<AuthState> mapEventToState(AuthEvent event) async* {
  //   if (event is AuthLoginRequested) {
  //     yield AuthLoading();
  //     try {
  //       final user = await authService.login(event.email, event.password);
  //       yield AuthAuthenticated(user: user);
  //     } catch (error) {
  //       yield AuthUnauthenticated(message: error.toString());
  //     }
  //   } else if (event is AuthSignUpRequested) {
  //     yield AuthLoading();
  //     try {
  //       final result =
  //           await authService.signUp(event.name, event.email, event.password);
  //       if (result['success']) {
  //         yield AuthAuthenticated(user: result['user']);
  //       } else {
  //         yield AuthUnauthenticated(message: result['message']);
  //       }
  //     } catch (error) {
  //       yield AuthUnauthenticated(message: error.toString());
  //     }
  //   } else if (event is AuthLogoutRequested) {
  //     await authService.logout();
  //     yield AuthUnauthenticated();
  //   }
  // }
}
