import 'package:flutter/cupertino.dart';

class RegisterAuthViewModal extends ChangeNotifier{
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

}