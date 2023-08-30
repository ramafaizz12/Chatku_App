import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logoutanonymus() async {
    _auth.signOut();
  }

  Future<User?> signinEmail(String email, String pass) async {
    UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    User firebaseuser = result.user!;
    return firebaseuser;
  }

  static Stream<User?> get firebaseuserstream => _auth.authStateChanges();
}
