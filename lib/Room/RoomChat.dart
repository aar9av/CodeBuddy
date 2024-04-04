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
  bool isChat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[7]),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                  Container(
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
                        SingleChildScrollView(
                          child: Container(
                            height: 550,
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
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5))
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
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(4)),
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
                  ) :
                  SingleChildScrollView(
                    child: Container(
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
                            width: double.infinity,
                            color: Data.themeColors[6],
                            padding: const EdgeInsets.all(10),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Data.themeColors[5],
                                  fontSize: 15,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'ABOUT ROOM:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n${Data.roomData[widget.index][3]}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              'Room Members',
                              style: TextStyle(
                                color: Data.themeColors[0],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Divider(
                              color: Data.themeColors[0],
                            ),
                          ),
                          Container(
                            height: 400,
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: Data.roomData[widget.index][5].length,
                              itemBuilder: (BuildContext context, int index) {
                                return SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'Assets/Profile.png',
                                        height: 50,
                                      ),
                                      Text(
                                        Data.roomData[widget.index][5][index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Data.themeColors[5],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
