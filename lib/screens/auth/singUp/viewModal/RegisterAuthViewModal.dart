import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/data/modal/user.dart';
import 'package:weatherappdynamic/utils/utils.dart';

class RegisterAuthViewModal extends ChangeNotifier{
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signUp(UserData userData,BuildContext context) async {
    _isLoading = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData.email!,
        password: userData.password!,
      ).whenComplete(() => createUser(UserData(username: userData.username, email: userData.email, password: userData.password)));
      _isLoading = false;
      Utils.toastMessage("Register Successfully!", successColor);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _isLoading = false;
        Utils.toastMessage("Weak Password", errorColor);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _isLoading = false;
        Utils.toastMessage("Email already in registered!", errorColor);
      }
    } catch (e) {
      _isLoading = false;
      Utils.toastMessage("Please check your Internet Connection!", errorColor);
    }
  }

  final _db = FirebaseFirestore.instance;

  Future<UserData> createUser(UserData user) async {
    try {
      List<String> emails = [];
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Users').get();
      querySnapshot.docs.forEach((doc) {
        emails.add(doc["email"]);
        print(" Exist email-- ${doc["email"]}");
      });
      if(emails.contains(user.email)){
        print("Data already added!");
      }else{
        await _db.collection("Users").add(user.toJson());
        print("Data added");
      }
      return user;
    } catch (error, stackTrace) {
      print(error);
      Utils.toastMessage("Failed!", errorColor);
      throw error;
    }
  }



}