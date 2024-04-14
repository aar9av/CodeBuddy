// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Start/Appbar.dart';
import 'ChatBox.dart';
import 'RoomDiscription.dart';

class RoomChat extends StatefulWidget {
  final int index;

  const RoomChat({super.key, required this.index});

  @override
  _RoomChatState createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  bool isChat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[7]),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Data.themeColors[0],
                        Data.themeColors[0].withAlpha(100),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      Data.roomData[widget.index][1],
                      style: TextStyle(
                        color: Data.themeColors[7],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onHorizontalDragEnd: (DragEndDetails details) {
                    if (details.primaryVelocity! < 0) {
                      if(isChat) {
                        setState(() {
                          isChat = !isChat;
                        });
                      }
                    } else if (details.primaryVelocity! > 0) {
                      if(!isChat) {
                        setState(() {
                          isChat = !isChat;
                        });
                      }
                    }
                  },
                  child: isChat ?
                  ChatBox(index: widget.index) :
                  RoomDescription(index: widget.index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
