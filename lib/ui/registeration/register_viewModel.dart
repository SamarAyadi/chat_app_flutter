

import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/data_base/my_database.dart';
import 'package:chat_app_flutter/model/my_user.dart';
import 'package:chat_app_flutter/shared_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class RegisterNavigator extends BaseNavigator{
void gotoHome();
}

class RegisterViewModel extends BaseViewModel<RegisterNavigator>{
  RegisterNavigator? navigator;
  var auth = FirebaseAuth.instance;
  void register(String email,
      String password, String userName, String fullName)async{
    navigator?.showLoadingDialog();
 try{

   var credentials = await auth.createUserWithEmailAndPassword(email: email,
       password: password);
      MyUser newUser = MyUser(
     id: credentials.user?.uid,
     fullName: fullName,
     userName: userName,
     email: email,
   );
   var insertedUser = await   MyDatabase.insertUser(newUser);
   navigator?.hideLoadingDialog();
   if(insertedUser !=null){
// user inserted successfully
     SharedData.user = insertedUser;
     navigator?.gotoHome();

   }else{
// error with database show error
     navigator?.showMessageDialog(' Something went wrong, error with database');
   }

 }on FirebaseAuthException catch (e) {
   navigator?.hideLoadingDialog();
   if (e.code == 'weak-password') {
    navigator?.showMessageDialog('The password provided is too weak.');

   } else if (e.code == 'email-already-in-use') {
     navigator?.showMessageDialog(' The account already exists for that email.');

   }
 } catch (e) {
   navigator?.hideLoadingDialog();
   navigator?.showMessageDialog(' Something went wrong, please try again later');
 }
  }

}