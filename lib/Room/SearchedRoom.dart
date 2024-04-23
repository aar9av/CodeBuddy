// ignore_for_file: library_private_types_in_public_api

import 'package:codebuddy/Room/RoomDiscription.dart';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import 'SearchedRoomDescription.dart';

class SearchedRoom extends StatefulWidget {

  @override
  _SearchedRoomState createState() => _SearchedRoomState();
}

class _SearchedRoomState extends State<SearchedRoom> {
  TextEditingController message = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    dynamic roomData = Data.searchedRoom;
    dynamic roomChats = Data.searchedRoomChats;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 54,
        centerTitle: true,
        backgroundColor: Data.themeColors[0],
        title: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchedRoomDescription(),));
          },
          child: Text(
            roomData['name'],
            style: TextStyle(
              color: Data.themeColors[7],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 90,
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height - 126,
                          color: Data.themeColors[7],
                          padding: const EdgeInsets.all(10),
                          child: ListView.builder(
                            reverse: true,
                            itemCount: Data.searchedRoomChats.length,
                            itemBuilder: (context, index) {
                              final message = Data.searchedRoomChats[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: message['user'] == Data.username ? Alignment.centerRight : Alignment.centerLeft,
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
                                          color: message['user'] == Data.username ? Data.themeColors[7] : Data.themeColors[0],
                                        ),
                                        color: message['user'] == Data.username ? Data.themeColors[0] : Data.themeColors[7],
                                      ),
                                      child: Text(
                                        message['user'] == Data.username ? message['body'] : '@${message['user']}\n${message['body']}',
                                        style: TextStyle(
                                          color: message['user'] == Data.username ? Data.themeColors[7] : Data.themeColors[0],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 36,
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
                        onTap: () async {
                          if(!isLoading) {
                            setState(() {
                              isLoading = true;
                            });
                            bool chk = await Functions.addMessage(
                                message.text, roomData['id'].toString(), true);
                            if (chk) {
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Center(
                                    child: Text(
                                      'Unable to send message !!!',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            message.clear();
                          }
                        },
                        child: Container(
                          height: 36,
                          width: 90,
                          color: Data.themeColors[0],
                          child: Center(
                            child: isLoading ?
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Data.themeColors[7],
                                strokeWidth: 2,
                              ),
                            ):
                            Icon(
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
          ),
        ),
      ),
    );
  }
}
