import 'package:equatable/equatable.dart';
import 'package:second/models/user.dart';

abstract class AuthState extends Equatable {
  final bool loading;
  final String exceptionMessage;
  const AuthState({this.exceptionMessage = '', this.loading = false});
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  final String message;

  const AuthUnauthenticated({this.message = ''});

  @override
  List<Object> get props => [message];
}

class UserState extends AuthState {
  final User? user;
  const UserState({this.user, super.loading});
}

class UserNotFoundState extends AuthState {
  const UserNotFoundState({super.loading, super.exceptionMessage}) : super();
}
