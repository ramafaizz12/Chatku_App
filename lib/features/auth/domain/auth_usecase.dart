import 'package:chat_app_firebase/features/auth/data/auth_repository.dart';
import 'package:chat_app_firebase/features/auth/data/models/auth.dart';

class AuthUseCase {
  final AuthRepository _authrepo = AuthRepository();

  Future<void> signIn(String email, String password) async {
    try {
      await _authrepo.signinEmail(email, password);
      await _authrepo.saveuserfromfirebase();
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  Future<void> logOut() async {
    try {
      await _authrepo.logoutanonymus();
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  Future<DataAuth> getuser() async {
    try {
      var data = await _authrepo.getuserfromfirebase();

      return data!;
    } catch (e) {
      throw Exception(e);
    }
  }
}
