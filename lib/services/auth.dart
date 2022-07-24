import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  User? get loggedUser;
  Future<void> registerUser({required String email, required String password});
  Future<UserCredential?> login(
      {required String email, required String password});
  Future<void> signOut();
}

class EmailPasswordAuth implements BaseAuth {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  User? get loggedUser => _firebaseAuth.currentUser;

  @override
  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<UserCredential?> login(
      {required String email, required String password}) async {
    UserCredential? userCred;

    try {
      userCred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCred;
    } catch (e) {
      print(e);
    }
    return userCred;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
