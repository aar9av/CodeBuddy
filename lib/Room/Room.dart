import 'dart:math';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import 'RoomChat.dart';


class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Data.themeColors[0],
                        Data.themeColors[0].withAlpha(100),
                      ]
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          'ROOMS JOINED',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: min(MediaQuery.of(context).size.height - 250, (Data.userRooms.length) * 140),
                      color: Colors.transparent,
                      child: ListView.builder(
                          itemCount: Data.userRooms.length,
                          itemBuilder: (context, index) {
                            dynamic roomData = Data.userRooms[index];
                            return GestureDetector(
                              onTap: () async {
                                await Functions.getRoomChat(roomData['id'], false);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RoomChat(index: index),),
                                );
                              },
                              child: Container(
                                  height: 130,
                                  width: double.infinity,
                                  padding:  const EdgeInsets.all(10),
                                  margin:  const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Data.themeColors[7],
                                    borderRadius:  const BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'Assets/Profile.png',
                                            height: 20,
                                          ),
                                          Text(
                                            '  ${roomData['host']}',
                                            style: TextStyle(
                                              color: Data.themeColors[5],
                                              fontSize: 18,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          roomData['name'],
                                          style: TextStyle(
                                            color: Data.themeColors[5],
                                            fontSize: 24,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Divider(
                                        color: Data.themeColors[5],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${roomData['participants'].length} members',
                                          style: TextStyle(
                                            color: Data.themeColors[5],
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            );
                          }
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
