import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vaquinhadori/myTheme.dart';
import 'package:vaquinhadori/myHomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // statusBar and systemNavigationBar transparents
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaquinha do Ri',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: MyTheme.colorScheme1,
        fontFamily: MyTheme.primaryFont,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 22),
            titleMedium: TextStyle(fontSize: 34),
            bodyLarge: TextStyle(fontSize: 34)),
        appBarTheme: const AppBarTheme(
          backgroundColor: MyTheme.darkBlue,
          foregroundColor: MyTheme.almostWhite,
          toolbarHeight: 130,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: MyTheme.almostWhite,
              fontSize: 45,
              fontFamily: MyTheme.primaryFont),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
