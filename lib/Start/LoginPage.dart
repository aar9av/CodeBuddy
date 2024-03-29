// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../Functionalities and Data/GoogleAuthentication.dart';
import 'Dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            //GoogleAuthentication authentication = GoogleAuthentication();
            //await authentication.googleAuthentication(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  const DashBoard()),
            );
          },
          icon: Image.asset(
            'Assets/Google.png',
            height: 50,
          ),
        ),
      ),
    );
  }
}
