import 'dart:math';

import 'package:code_buddy/RoomCard.dart';
import 'package:flutter/material.dart';


class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> joinedRoomData = [
      ["@aar9av", "2 months ago", "Flutter", "1 member", "Android Development"],
      ["@shivam", "2 month ago", "C++", "10 member", "DSA"],
      ["@prince", "2 month ago", "Java Script", "20 member", "Web Development"],
    ];
    List<dynamic> createdRoomData = [
      ["@aar9av", "2 months ago", "Flutter", "1 member", "Android Development"],
      ["@shivam", "2 month ago", "C++", "1 member", "DSA"],
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height - 620, 620),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 320,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF7469B6),
                        const Color(0xFF7469B6).withAlpha(100),
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
                      height: 280,
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: joinedRoomData.length,
                        itemBuilder: (context, index) {
                          return RoomCard(isCreated: false, roomData: joinedRoomData[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 260,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF7469B6),
                            const Color(0xFF7469B6).withAlpha(100),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          'RECENT CREATED',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: createdRoomData.length,
                          itemBuilder: (context, index) {
                            return RoomCard(isCreated: true, roomData: createdRoomData[index]);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        elevation: 5,
        backgroundColor: const Color(0xFF7469B6),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 36,
        ),
      ),
    );
  }
}
