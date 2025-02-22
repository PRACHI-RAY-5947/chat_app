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
    apiKey: 'AIzaSyCR6-86QwsExlN5QRqdGduKSzAClHzyWaQ',
    appId: '1:541345764871:web:6e7b5537bb6a7263c47ca2',
    messagingSenderId: '541345764871',
    projectId: 'af5-chat-app',
    authDomain: 'af5-chat-app.firebaseapp.com',
    storageBucket: 'af5-chat-app.appspot.com',
    measurementId: 'G-H1NS771N9J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXYuq4fjFExhYStlxVm6sm9shMbL7xOPw',
    appId: '1:541345764871:android:8baba0759e035117c47ca2',
    messagingSenderId: '541345764871',
    projectId: 'af5-chat-app',
    storageBucket: 'af5-chat-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAQhsEKP9CgBAeBIKAlTnhZpPA16CL0Rc',
    appId: '1:541345764871:ios:53b67d7ade6099bfc47ca2',
    messagingSenderId: '541345764871',
    projectId: 'af5-chat-app',
    storageBucket: 'af5-chat-app.appspot.com',
    iosBundleId: 'com.example.chatAppAf5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAQhsEKP9CgBAeBIKAlTnhZpPA16CL0Rc',
    appId: '1:541345764871:ios:53b67d7ade6099bfc47ca2',
    messagingSenderId: '541345764871',
    projectId: 'af5-chat-app',
    storageBucket: 'af5-chat-app.appspot.com',
    iosBundleId: 'com.example.chatAppAf5',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCR6-86QwsExlN5QRqdGduKSzAClHzyWaQ',
    appId: '1:541345764871:web:6a84b99175377282c47ca2',
    messagingSenderId: '541345764871',
    projectId: 'af5-chat-app',
    authDomain: 'af5-chat-app.firebaseapp.com',
    storageBucket: 'af5-chat-app.appspot.com',
    measurementId: 'G-XH7R8YYB8J',
  );
}