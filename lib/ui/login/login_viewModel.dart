import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/dialogueUtils.dart';
import 'package:chat_app_flutter/shared_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 abstract class LoginNavigator extends BaseNavigator{
 void gotoHome();
 }

class LoginViewModel extends BaseViewModel<LoginNavigator> {


  var auth = FirebaseAuth.instance;

  void login(String email, String password)async{
    try{
   navigator?.showLoadingDialog();
      var credential = await auth.signInWithEmailAndPassword(email: email, password: password);

   // Get user from DB
   var retrievedUser = await MyDatabase.getUserById(credential.user?.uid ?? '');

   navigator?.hideLoadingDialog();
   if (retrievedUser == null) {
     navigator?.showMessageDialog('Something went wrong user name or password');
   } else {
// user inserted successfully
     SharedData.user = retrievedUser;
     navigator?.gotoHome();
   }




    }
    on FirebaseAuthException catch (e) {
      navigator?.hideLoadingDialog();
      navigator?.showMessageDialog('wrong user name or password');
     // show message with wrong email or password


      }
  }

  void checkLoggedInUser() async {
    if (auth.currentUser != null) {
      var retrievedUser = await MyDatabase.getUserById(auth.currentUser?.uid ?? '');
      SharedData.user = retrievedUser;
      navigator?.gotoHome();
    }
  }



}