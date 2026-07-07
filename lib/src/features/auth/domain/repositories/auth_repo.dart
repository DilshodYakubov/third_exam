import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth;
  // ignore: prefer_initializing_formals
  AuthRepo({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      throw "Email yoki parol noto'g'ri";
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (_) {
      throw "Email yoki parol noto'g'ri";
    } catch (e) {
      rethrow;
    }
  }
}
