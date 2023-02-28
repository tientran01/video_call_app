import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static final shared = AuthenticationService._internal();
  AuthenticationService._internal();
  final _auth = FirebaseAuth.instance;
  Future<UserCredential>? userCredential;

  void signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    userCredential = _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
