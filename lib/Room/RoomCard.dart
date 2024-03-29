// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import 'RoomChat.dart';

class RoomCard extends StatelessWidget {
  final isCreated;
  final index;

   const RoomCard({
    super.key,
    required this.isCreated,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
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
            color: Colors.black,
            borderRadius:  const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: isCreated ? Data.themeColors[5] : Data.themeColors[7],
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'Assets/Profile.png',
                        height: 20,
                        color: Data.themeColors[5],
                      ),
                      Text(
                        '  ${Data.roomData[index][0]}',
                        style: TextStyle(
                          color: Data.themeColors[5],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    Data.roomData[index][4],
                    style: TextStyle(
                      color: Data.themeColors[5],
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Data.roomData[index][1],
                  style: TextStyle(
                    color: Data.themeColors[5],
                    fontSize: 24,
                  ),
                ),
              ),
              Divider(
                color: Data.themeColors[5],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Data.roomData[index][5].length} members',
                    style: TextStyle(
                      color: Data.themeColors[5],
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    padding:  const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Data.themeColors[5],
                      borderRadius:  const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      Data.roomData[index][2],
                      style:  const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
