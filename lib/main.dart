import 'dart:io';

import 'package:bookapp/core.dart';
import 'package:bookapp/widgets/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBmqUrW7ngWNbZ0PivBhUyT9DVPJ7Mx6YM',
              appId: '1:963653775874:android:91ba2d179e133adbfc6d1b',
              messagingSenderId: '963653775874',
              projectId: 'bookspace-2b352'))
      : await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.navigatorKey,
      title: 'Bookspace',
      debugShowCheckedModeBanner: false,
      home: const SplashScreenView(
        child: Wrapper(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
                child: const SplashScreenView(),
                type: PageTransitionType.theme,
                settings: settings,
                reverseDuration: const Duration(seconds: 3));
        }
        return null;
      },
    );
  }
}
