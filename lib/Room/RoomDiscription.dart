import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';

class RoomDescription extends StatelessWidget {
  final int index;

  const RoomDescription({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 160,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Data.themeColors[0],
                      borderRadius: const BorderRadius.all(Radius.circular(200)),
                    ),
                    child: Text(
                      Data.roomData[index][2],
                      style: TextStyle(
                        fontSize: 30,
                        color: Data.themeColors[7],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    Data.roomData[index][0],
                    style: TextStyle(
                      fontSize: 24,
                      color: Data.themeColors[0],
                    ),
                  ),
                  Text(
                    '${Data.roomData[index][5].length} members',
                    style: TextStyle(
                      fontSize: 15,
                      color: Data.themeColors[5],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Data.themeColors[5],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ABOUT ROOM:',
                style: TextStyle(
                  color: Data.themeColors[5],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Data.roomData[index][3],
                style: TextStyle(
                  color: Data.themeColors[5],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Data.themeColors[5],
            ),
            Text(
              'Room Members',
              style: TextStyle(
                color: Data.themeColors[0],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  Data.roomData[index][5].length,
                      (memberIndex) {
                    return Container(
                      width: 120,
                      margin:  const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Assets/Profile.png',
                            height: 80,
                          ),
                          Text(
                            Data.roomData[index][5][memberIndex],
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
            ),
          ],
        ),
      ),
    );
  }
}
