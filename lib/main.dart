import 'package:chat_app/pages/chatPage.dart';
import 'package:chat_app/pages/friendsPage.dart';
import 'package:chat_app/pages/homePage.dart';
import 'package:chat_app/pages/signInPage.dart';
import 'package:chat_app/service/fcm_services.dart';
import 'package:chat_app/service/firestore_services.dart';
import 'package:chat_app/service/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'all_users/allusers.dart';
import 'firebase_option.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Logger().f("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationServices.instance.initNotification();
  await FcmServices.instance.init();

  tz.initializeTimeZones();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
      FireStoreService.instance.currentUser == null ? '/' : 'home_page',
      routes: {
        '/': (context) => const SignInPage(),
        'home_page': (context) => const HomePage(),
        'all_users': (context) => const AllUsersPage(),
        'friends': (context) => const MyFriends(),
        'chat_page': (context) => ChatPage(),
      },
    );
  }
}