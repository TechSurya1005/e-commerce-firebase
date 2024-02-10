import 'package:flutter/cupertino.dart';

class LoginAuthViewModal extends ChangeNotifier{
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

}