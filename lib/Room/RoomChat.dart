// ignore_for_file: library_private_types_in_public_api

import 'package:code_buddy/Start/Appbar.dart';
import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import 'Chat.dart';

class RoomChat extends StatefulWidget {
  final int index;

  const RoomChat({super.key, required this.index});

  @override
  _RoomChatState createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[7]),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 600,
            width: double.infinity,
            margin: const EdgeInsets.all(15),
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Data.roomData[widget.index][1],
                  style: TextStyle(
                    color: Data.themeColors[7],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 550,
                  decoration: BoxDecoration(
                    color: Data.themeColors[7],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        color: Data.themeColors[6],
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          Data.roomData[widget.index][3],
                          style: TextStyle(
                            color: Data.themeColors[5],
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 440,
                          color: Data.themeColors[7],
                          padding: const EdgeInsets.all(10),
                          child: ListView(
                            reverse: true,
                            children: Data.roomData[widget.index][6].reversed.map<Widget>((message) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Chat(msg: message[0], sender: message[1]),
                                  const SizedBox(height: 5),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Data.themeColors[6],
                              ),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: message,
                                decoration: InputDecoration(
                                  hintText: 'Write Something ...',
                                  hintStyle: TextStyle(
                                    color: Data.themeColors[5],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Data.themeColors[6]),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Data.themeColors[6]),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                ),
                                style: TextStyle(
                                  color: Data.themeColors[0],
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Data.roomData[widget.index][6].add([message.text, Data.username]);
                              });
                              message.clear();
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Data.themeColors[0],
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(2)),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.send,
                                  color: Data.themeColors[7],
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
