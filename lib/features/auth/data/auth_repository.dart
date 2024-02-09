import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logoutanonymus() async {
    _auth.signOut();
  }

  Future<User?> signinEmail(String email, String pass) async {
    UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    User firebaseuser = result.user!;
    _firestore
        .collection('users')
        .doc(firebaseuser.uid)
        .set({'uid': firebaseuser.uid, 'email': firebaseuser.email});
    return firebaseuser;
  }

  static Stream<User?> get firebaseuserstream => _auth.authStateChanges();
  static User? get firebaseuserauth => _auth.currentUser;
}
