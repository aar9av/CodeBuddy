import 'package:code_buddy/Appbar.dart';
import 'package:flutter/material.dart';
import 'Chat.dart';

class RoomChat extends StatefulWidget {
  const RoomChat({super.key});

  @override
  State<RoomChat> createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  Color themeColor = const Color(0xFF9DB2BF);
  TextEditingController message = TextEditingController();
  List<dynamic> chat = [
    ["HI", "@aar9av"],
    ["Hello", "@shivam"],
    ["Aur bhai kya haal chaal.", "@prince"],
    ["Mai badhia tum log batao", "@aar9av"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(searchBarText: 'Search Room Member'),
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
                  themeColor,
                  themeColor.withAlpha(100),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Create New Room',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
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
                        color: const Color(0xFF1F1F1F),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Room Description:\nGood Room\nVery Good Room.\nVery very Good Room',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 440,
                          color: Colors.black,
                          padding: const EdgeInsets.all(10),
                          child: ListView(
                            reverse: true,
                            children: chat.reversed.map((message) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Chat(msg: message[0], sender: message[1]),
                                  const SizedBox(
                                    height: 5,
                                  )
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
                              decoration: const BoxDecoration(
                                color: Color(0xFF1F1F1F),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: message,
                                decoration: InputDecoration(
                                  hintText: 'Write Something ...',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF1F1F1F)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF1F1F1F)),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                ),
                                style: TextStyle(
                                  color: themeColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                chat.add([message.text, "@aar9av"]);
                              });
                              message.clear();
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                color: themeColor,
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(2)),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.send,
                                  color: Colors.black,
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
