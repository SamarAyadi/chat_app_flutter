import 'package:chat_app_flutter/base/base.dart';
import 'package:chat_app_flutter/dialogueUtils.dart';
import 'package:chat_app_flutter/ui/home/home_screen.dart';
import 'package:chat_app_flutter/ui/login/login_screen.dart';
import 'package:chat_app_flutter/ui/registeration/register_viewModel.dart';
import 'package:chat_app_flutter/validation_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen, RegisterViewModel>
    implements RegisterNavigator{
  bool securedPassword = true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();
  var userNameController = TextEditingController();

 @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> viewModel   ,
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
                  'Create Account',
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
                      controller: fullNameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Full Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                      ),
                    ),
                    TextFormField(
                      controller: userNameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter User Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'User Name',
                      ),
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
                        createAccountClicked();
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
                        'Create Account',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        'Already have Account?',
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

  var authService = FirebaseAuth.instance;

  void createAccountClicked() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    viewModel.register(emailController.text, passwordController.text,
    userNameController.text, fullNameController.text);

  }


@override
  void gotoHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName );
  }


}
