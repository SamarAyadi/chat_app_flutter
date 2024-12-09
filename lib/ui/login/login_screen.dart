import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/dialogueUtils.dart';
import 'package:chat_app_flutter/ui/home/home_screen.dart';
import 'package:chat_app_flutter/ui/login/login_viewModel.dart';
import 'package:chat_app_flutter/ui/registeration/register_screen.dart';
import 'package:chat_app_flutter/validation_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel>
  implements LoginNavigator {
  bool securedPassword = true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  LoginViewModel initViewModel() {

   return LoginViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0), // Add 20 pixels of top margin
              child: Center(
                child: Text(
                  'Chat App Online',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),

                    TextFormField(
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Email';
                        }
                        if (!ValidationUtils.isValidEmail(text)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      obscureText: securedPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              securedPassword = !securedPassword;
                            });
                          },
                          child: Icon(
                            securedPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        signIn();
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          EdgeInsets.all(12),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          Colors.blue,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        'Or Create Account?',
                        style: TextStyle(
                          color: Colors.blue, // Set the text color to blue
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  void signIn() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    viewModel.login(emailController.text, passwordController.text);

  }

  @override
  void gotoHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName );
  }







}
