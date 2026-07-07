import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_exam/src/features/auth/domain/repositories/auth_repo.dart';
import 'package:third_exam/src/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit({required this.repo}) : super(AuthInitail());
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      final creds = await repo.signUp(email: email, password: password);
      emit(AuthSuccess(user: creds.user!));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final creds = await repo.signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: creds.user!));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

}
