import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/data/modal/user.dart';
import 'package:weatherappdynamic/main.dart';

import '../../../../utils/utils.dart';

class LoginAuthViewModal extends ChangeNotifier{
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signIn(UserData userData,BuildContext context)async {
    try {
      _isLoading = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      );
      _isLoading = false;
      box.write("isLogged", true);
      Utils.toastMessage("Login Successfully!",successColor);
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage("Wrong password provided for that user",errorColor);
      if (e.code == 'user-not-found') {
        _isLoading = false;
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _isLoading = false;
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      _isLoading = false;
      print(e);
    }
  }
}