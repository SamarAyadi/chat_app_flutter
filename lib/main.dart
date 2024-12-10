import 'package:chat_app_flutter/firebase_options.dart';
import 'package:chat_app_flutter/ui/addRoom/add_room_screen.dart';
import 'package:chat_app_flutter/ui/chat/chat_thread.dart';
import 'package:chat_app_flutter/ui/home/home_screen.dart';
import 'package:chat_app_flutter/ui/login/login_screen.dart';
import 'package:chat_app_flutter/ui/registeration/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        AddRoomScreen.routeName: (_) => AddRoomScreen(),
        ChatThread.routeName: (_) => ChatThread(),
      },
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
