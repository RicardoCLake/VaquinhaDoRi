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
      debugShowCheckedModeBanner: false,
      title: 'Vaquinha do Ricardo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: MyTheme.colorScheme1,
        fontFamily: MyTheme.primaryFont,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 18),
            titleMedium: TextStyle(fontSize: 24),
            bodyLarge: TextStyle(fontSize: 20)),
        appBarTheme: const AppBarTheme(
          backgroundColor: MyTheme.darkBlue,
          foregroundColor: MyTheme.almostWhite,
          toolbarHeight: 130,
          centerTitle: false,
          titleTextStyle: TextStyle(color: MyTheme.almostWhite),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
