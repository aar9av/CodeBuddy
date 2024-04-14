import 'dart:math';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import 'CreateRoom.dart';
import 'RoomCard.dart';


class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  bool isCreated = false;
  List<int> roomCreated = Functions.getCreatedRoomData();

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
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          isCreated ? 'ROOMS CREATED' : 'ROOMS JOINED',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: min(MediaQuery.of(context).size.height - 330, (isCreated ? roomCreated.length : Data.roomData.length) * 140),
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: isCreated ? roomCreated.length : Data.roomData.length,
                        itemBuilder: (context, index) {
                            return isCreated ? RoomCard(index: roomCreated[index]) : RoomCard(index: index);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCreated = !(isCreated);
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Data.themeColors[0],
                          Data.themeColors[0].withAlpha(100),
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text(
                        isCreated ? 'ROOM JOINED' : 'ROOM CREATED',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateRoom(),),
          );
        },
        elevation: 5,
        backgroundColor: Data.themeColors[0],
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 36,
        ),
      ),
    );
  }
}
