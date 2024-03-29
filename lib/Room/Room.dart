import 'dart:math';

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import 'CreateRoom.dart';
import 'RoomCard.dart';


class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {

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
                      height: 280,
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: Data.roomData.length,
                        itemBuilder: (context, index) {
                          return RoomCard(isCreated: false, index: index);
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
                            Data.themeColors[0],
                            Data.themeColors[0].withAlpha(100),
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
                          itemCount: Data.roomData.length,
                          itemBuilder: (context, index) {
                            if (Data.roomData[index][0] == Data.username) {
                              return RoomCard(isCreated: true, index: index);
                            } else {
                              return const SizedBox.shrink();
                            }
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateRoom(),),
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
