import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/utils/model/user_model.dart';

class SingUpController extends ChangeNotifier {
  var singUpKey = GlobalKey<FormState>();
  TextEditingController mailSingUpController = TextEditingController();
  TextEditingController passwordSingUpController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isVisibility = true;
  bool _isVisibilityConfirm = true;

  bool get isVisibility => _isVisibility;
  set isVisibility(bool value) {
    _isVisibility = value;
    notifyListeners();
  }

  bool get isVisibilityConfirm => _isVisibilityConfirm;
  set isVisibilityConfirm(bool value) {
    _isVisibilityConfirm = value;
    notifyListeners();
  }

  void changeVisibility() {
    isVisibility = !isVisibility;
  }

  void changeVisibilityConfirm() {
    isVisibilityConfirm = !isVisibilityConfirm;
  }

  Future<void> SignUpAuth(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mailSingUpController.text,
        password: passwordSingUpController.text,
      );
      addUser(credential.user?.email ?? '', passwordSingUpController.text,
          credential.user!.uid);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AnimatedSnackBar.material(
          'The password provided is too weak',
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else if (e.code == 'email-already-in-use') {
        AnimatedSnackBar.material(
          'The account already exists for that email',
          type: AnimatedSnackBarType.error,
        ).show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  void addUser(String mail, String password, String id) {
   try {
      UserModel userModel = UserModel(email: mail, password: password, id: id);
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userModel.toMap());
   } catch (e) {
     print(e.toString());
   }
  }
  //!================================================================
  //!================================================================
}
