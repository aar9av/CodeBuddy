import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final msg;
  final sender;

  const Chat({super.key, this.msg, this.sender});

  @override
  Widget build(BuildContext context) {
    Color themeColor = const Color(0xFF9DB2BF);
    bool isSender = sender == '@aar9av';
    Color textColor = isSender ? Colors.black : themeColor;
    Color boxColor = isSender ? themeColor : Colors.black;
    Color borderColor = textColor;
    String message = isSender ? msg : sender + '\n' + msg;
    Alignment al = isSender ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: al,
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
            color: borderColor,
          ),
          color: boxColor,
        ),
        child: Text(
          message,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
