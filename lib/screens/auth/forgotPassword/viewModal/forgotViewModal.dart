import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/utils/utils.dart';

class ForgotPasswordViewModal extends ChangeNotifier {

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  Future<void> forgotPassword(String email,BuildContext context)async {
    try{
      _isLoading = true;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email)
      .then((value) {
        Navigator.pop(context);
        return Utils.snackBar("We have sent reset password link on your email", context);
      })
          .onError((error, stackTrace) => Utils.toastMessage("Please enter register email address", errorColor)
      );
      _isLoading= false;
    }on FirebaseAuthException catch (e) {
      _isLoading= false;
      Utils.toastMessage("Something went wrong $e ",errorColor);
    }

  }

}