import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import '../Profile/SearchedUser.dart';

class RoomDescription extends StatelessWidget {
  final int index;

  const RoomDescription({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    dynamic roomData = Data.userRooms[index];
    String tags = '';
    for(int i=0; i<roomData['topics'].length; ++i) {
      tags += roomData['topics'][i]['name'];
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      color: Data.themeColors[6],
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            padding:  const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                borderRadius:  const BorderRadius.all(Radius.circular(50)),
                                color: Data.themeColors[7],
                                border: Border.all(
                                  color: Data.themeColors[0],
                                )
                            ),
                            child: Image.asset(
                              Data.platformIcon[0],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            roomData['name'],
                            style: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${roomData['participants'].length} members',
                            style: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Tags',
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: [
                            for (dynamic tag in roomData['topics'])
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  color: Data.themeColors[0],
                                ),
                                child: Text(
                                  tag['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Data.themeColors[7],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description:',
                            style: TextStyle(
                              color: Data.themeColors[5],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            roomData['description'],
                            style: TextStyle(
                              color: Data.themeColors[5],
                              fontSize: 16,
                            ),
                          ),
                          Divider(
                            color: Data.themeColors[5],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Room Members',
                    style: TextStyle(
                      color: Data.themeColors[0],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        roomData['participants'].length,
                            (memberIndex) {
                          return GestureDetector(
                            onTap: () async {
                              await Functions.findUser(
                                  roomData['participants'][memberIndex], '####');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (
                                    context) => const SearchedUser()),
                              );
                            },
                            child: Container(
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
                                    roomData['participants'][memberIndex],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Data.themeColors[5],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
