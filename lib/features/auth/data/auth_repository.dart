import 'package:chat_app_firebase/features/auth/data/models/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logoutanonymus() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signinEmail(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveuserfromfirebase() async {
    User? user = _auth.currentUser;
    try {
      _firestore.collection('users').doc(user!.uid).set(DataAuth(
              email: user.email, uid: user.uid, displayName: user.displayName)
          .toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DataAuth?> getuserfromfirebase() async {
    User? user = _auth.currentUser;
    try {
      DataAuth userModel = DataAuth(
        uid: user!.uid,
        email: user.email,
        displayName: user.displayName,
      );

      return userModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Stream<User?> get firebaseuserstream => _auth.authStateChanges();
}
