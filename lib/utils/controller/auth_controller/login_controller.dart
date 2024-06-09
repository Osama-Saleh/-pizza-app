part of '../../import_paths/import_paths.dart';

class LoginController extends ChangeNotifier {
  var singInKey = GlobalKey<FormState>();
  TextEditingController mailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  bool _isVisibility = true;

  bool get isVisibility => _isVisibility;
  set isVisibility(bool value) {
    _isVisibility = value;
    notifyListeners();
  }

  void changeVisibility() {
    isVisibility = !isVisibility;
  }

  Future<void> signInAuth() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mailLoginController.text,
          password: passwordLoginController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }

  Stream<User?> userState() {
    return FirebaseAuth.instance.authStateChanges();
  }
  Future<void> logOut()async {
    return await FirebaseAuth.instance.signOut();
  }
}
