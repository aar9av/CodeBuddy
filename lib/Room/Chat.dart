// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';


class Chat extends StatelessWidget {
  final msg;
  final sender;

  const Chat({super.key, this.msg, this.sender});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: sender == Data.username ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(
          left: 6,
          right: 6,
          top: 2,
          bottom: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: sender == Data.username ? Data.themeColors[7] : Data.themeColors[0],
          ),
          color: sender == Data.username ? Data.themeColors[0] : Data.themeColors[7],
        ),
        child: Text(
          sender == Data.username ? msg : sender + '\n' + msg,
          style: TextStyle(
            color: sender == Data.username ? Data.themeColors[7] : Data.themeColors[0],
          ),
        ),
      ),
    );
  }
}
