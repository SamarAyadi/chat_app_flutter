
import 'package:chat_app_flutter/firebase_options.dart';
import 'package:chat_app_flutter/ui/addRoom/add_room_screen.dart';
import 'package:chat_app_flutter/ui/home/home_screen.dart';
import 'package:chat_app_flutter/ui/login/login_screen.dart';
import 'package:chat_app_flutter/ui/registeration/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        RegisterScreen.routeName : (_)=>RegisterScreen(),
        LoginScreen.routeName : (_)=>LoginScreen(),
        HomeScreen.routeName : (_)=>HomeScreen(),
        AddRoomScreen.routeName:(_)=>AddRoomScreen()
      },

    );
  }
}


