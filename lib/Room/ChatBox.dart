// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';

class ChatBox extends StatefulWidget {
  final index;

  const ChatBox({super.key, this.index});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController();

    return Container(
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
            child: GestureDetector(
              onVerticalDragStart: (details) {
                print('Refreshed');
                setState(() {
                  Data.roomData = Data.roomData;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height - 180,
                color: Data.themeColors[7],
                padding: const EdgeInsets.all(10),
                child: ListView(
                  reverse: true,
                  children: Data.roomData[widget.index][6].reversed.map<Widget>((message) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: message[1] == Data.username ? Alignment.centerRight : Alignment.centerLeft,
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
                                  color: message[1] == Data.username ? Data.themeColors[7] : Data.themeColors[0],
                                ),
                                color: message[1] == Data.username ? Data.themeColors[0] : Data.themeColors[7],
                              ),
                              child: Text(
                                message[1] == Data.username ? message[0] : message[1] + '\n' + message[0],
                              style: TextStyle(
                                color: message[1] == Data.username ? Data.themeColors[7] : Data.themeColors[0],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Data.themeColors[6],
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8))
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
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Data.themeColors[0],
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8)),
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
    );
  }
}
