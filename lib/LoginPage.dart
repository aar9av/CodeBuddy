import 'package:flutter/material.dart';

import 'Dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashBoard()),
            );
          },
          icon: Image.asset(
            'Assets/Google.png',
            height: 50,
          ),
        )
      ),
    );
  }
}
