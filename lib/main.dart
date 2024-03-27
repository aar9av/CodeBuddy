import 'package:flutter/material.dart';

import 'LoginPage.dart';

void main() {
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
          background: const Color(0xFF000000),
          primary: const Color(0xFF818181),
          secondary: const Color(0xFF141414),
          outline: const Color(0xFF818181),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1F1F1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
