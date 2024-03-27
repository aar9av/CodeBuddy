import 'package:flutter/material.dart';


class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        body: Center(
          child: Text(
            'Room',
            style: TextStyle(
              color: Color(0xFF7469B6),
              fontSize: 60,
            ),
          ),
        )
    );
  }
}
