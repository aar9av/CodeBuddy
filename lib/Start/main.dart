// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import 'Dashboard.dart';
import 'HomePage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/Functionalities and Data/.env");
  runApp(const CodeBuddy());
}

class CodeBuddy extends StatelessWidget {
  const CodeBuddy({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeBuddy',
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
      home: Data.currentUser == null ? const HomePage() : const DashBoard(),
    );
  }
}
