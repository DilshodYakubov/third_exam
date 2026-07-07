import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitail extends AuthState {
  const AuthInitail();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthError extends AuthState {
  final String error;
  const AuthError({required this.error});
  @override
  List<Object?> get props => [error];
}

class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess({required this.user});
  @override
  List<Object?> get props => [user];
}
