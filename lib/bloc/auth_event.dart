import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthSignUpRequested(
      {required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class AuthLogoutRequested extends AuthEvent {}

class InitEvent extends AuthEvent {}
