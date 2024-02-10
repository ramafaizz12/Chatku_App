part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSukses extends AuthState {
  final String message;

  AuthSukses({required this.message});
}

final class AuthFailed extends AuthState {
  final String message;

  AuthFailed({required this.message});
}
