// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Functionalities and Data/Data.dart';
import 'LoginPage.dart';


Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const CodeBuddy());
}

class CodeBuddy extends StatelessWidget {
  const CodeBuddy({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          background: Data.themeColors[7],
          outline: Data.themeColors[5],
          primary: Data.themeColors[5]
        ),
        appBarTheme: AppBarTheme(
          color: Data.themeColors[6],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
