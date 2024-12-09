// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBIZ7e9DGFTAJbyajg1WUgCuJ-AJPHRR2w',
    appId: '1:785413012407:web:e52ee4afa92b602439c632',
    messagingSenderId: '785413012407',
    projectId: 'chat-app-flutter-f0159',
    authDomain: 'chat-app-flutter-f0159.firebaseapp.com',
    storageBucket: 'chat-app-flutter-f0159.firebasestorage.app',
    measurementId: 'G-488ELM0J77',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkPV8jS4475WqRytB9ME758t0iGxHGBH0',
    appId: '1:785413012407:android:93a53327b11d634c39c632',
    messagingSenderId: '785413012407',
    projectId: 'chat-app-flutter-f0159',
    storageBucket: 'chat-app-flutter-f0159.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrFvF1ZeSCHt7UBylY34O5nb-DGpARX3E',
    appId: '1:785413012407:ios:62fb5bb95becfe4139c632',
    messagingSenderId: '785413012407',
    projectId: 'chat-app-flutter-f0159',
    storageBucket: 'chat-app-flutter-f0159.firebasestorage.app',
    iosBundleId: 'com.example.chatAppFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrFvF1ZeSCHt7UBylY34O5nb-DGpARX3E',
    appId: '1:785413012407:ios:62fb5bb95becfe4139c632',
    messagingSenderId: '785413012407',
    projectId: 'chat-app-flutter-f0159',
    storageBucket: 'chat-app-flutter-f0159.firebasestorage.app',
    iosBundleId: 'com.example.chatAppFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBIZ7e9DGFTAJbyajg1WUgCuJ-AJPHRR2w',
    appId: '1:785413012407:web:81309834df6bdcea39c632',
    messagingSenderId: '785413012407',
    projectId: 'chat-app-flutter-f0159',
    authDomain: 'chat-app-flutter-f0159.firebaseapp.com',
    storageBucket: 'chat-app-flutter-f0159.firebasestorage.app',
    measurementId: 'G-BM6L81V8NJ',
  );
}
