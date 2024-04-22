
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import '../Start/Dashboard.dart';

class SearchedUser extends StatefulWidget {
  const SearchedUser({super.key});

  @override
  State<SearchedUser> createState() => _SearchedUserState();
}

class _SearchedUserState extends State<SearchedUser> {
  @override
  Widget build(BuildContext context) {
    int maxBarLen = max(Data.searchedUserPlatformData[0][1], Data.searchedUserPlatformData[1][1]);
    maxBarLen = max(maxBarLen, Data.searchedUserPlatformData[2][1]);

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Assets/Profile.png',
                      height: 100,
                    ),
                    Text(
                      '${Data.searchedUser?['first_name']} ${Data.searchedUser?['last_name']}',
                      style: TextStyle(
                        color: Data.themeColors[0],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Data.searchedUser?['username'],
                      style: TextStyle(
                        color: Data.themeColors[5],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse('https://leetcode.com/${Data.searchedUserPlatformData[0][0]}/');
                      if (!await launchUrl(url)) {
                      throw Exception('Could not launch');
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'Assets/Leetcode.png',
                            height: 40,
                          ),
                          Text(
                            Data.searchedUserPlatformData[0][0],
                            style: TextStyle(
                              fontSize: 12,
                              color: Data.themeColors[5],
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse('https://www.codechef.com/users/${Data.searchedUserPlatformData[1][0]}');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch');
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 0.2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'Assets/Codechef.png',
                            height: 40,
                          ),
                          Text(
                            Data.searchedUserPlatformData[1][0],
                            style: TextStyle(
                              fontSize: 12,
                              color: Data.themeColors[5],
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse('https://codeforces.com/profile/${Data.searchedUserPlatformData[2][0]}');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch');
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'Assets/CodeForces.png',
                            height: 40,
                          ),
                          Text(
                            Data.searchedUserPlatformData[2][0],
                            style: TextStyle(
                              fontSize: 12,
                              color: Data.themeColors[5],
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:  const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Data.themeColors[5],
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                      color: Data.themeColors[5],
                    ),
                    Text(
                      Data.searchedUser?['bio'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Data.themeColors[5],
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Data.themeColors[0],
                        Data.themeColors[0].withAlpha(100),
                      ]
                  ),
                  borderRadius:  const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(18),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius:  const BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                          color: Data.themeColors[7],
                          width: 2,
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            (Data.searchedUserPlatformData[0][1] + Data.searchedUserPlatformData[1][1] + Data.searchedUserPlatformData[2][1]).toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Solved',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 180,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Leetcode',
                                      style: TextStyle(
                                        color: Data.themeColors[1],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      height: Data.searchedUserPlatformData[0][2] == '' ? 0 : 12,
                                      decoration: BoxDecoration(
                                        color: Data.themeColors[4],
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Text(
                                        Data.searchedUserPlatformData[0][2],
                                        style: TextStyle(
                                          color: Functions.getBadgeColor(Data.searchedUserPlatformData[0][2]),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width - 180,
                                decoration: BoxDecoration(
                                  color: Data.themeColors[7],
                                  borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FractionallySizedBox(
                                    widthFactor: Data.searchedUserPlatformData[0][1]/(maxBarLen == 0 ? 1 : maxBarLen),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Data.themeColors[1],
                                        borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 180,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Codechef',
                                      style: TextStyle(
                                        color: Data.themeColors[2],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      height: Data.searchedUserPlatformData[1][2] == '' ? 0 : 12,
                                      decoration: BoxDecoration(
                                        color: Data.themeColors[4],
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Text(
                                        Data.searchedUserPlatformData[1][2],
                                        style: TextStyle(
                                          color: Functions.getBadgeColor(Data.searchedUserPlatformData[1][2]),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width - 180,
                                decoration: BoxDecoration(
                                  color: Data.themeColors[7],
                                  borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FractionallySizedBox(
                                    widthFactor: Data.searchedUserPlatformData[1][1]/(maxBarLen == 0 ? 1 : maxBarLen),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Data.themeColors[2],
                                        borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 180,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Codeforces',
                                      style: TextStyle(
                                        color: Data.themeColors[3],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                      height: Data.searchedUserPlatformData[2][2] == '' ? 0 : 12,
                                      decoration: BoxDecoration(
                                        color: Data.themeColors[4],
                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Text(
                                        Data.searchedUserPlatformData[2][2],
                                        style: TextStyle(
                                          color: Functions.getBadgeColor(Data.searchedUserPlatformData[2][2]),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 5,
                                width: MediaQuery.of(context).size.width - 180,
                                decoration: BoxDecoration(
                                  color: Data.themeColors[7],
                                  borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FractionallySizedBox(
                                    widthFactor: Data.searchedUserPlatformData[2][1]/(maxBarLen == 0 ? 1 : maxBarLen),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Data.themeColors[3],
                                        borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                                      ),
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
              Container(
                width: double.infinity,
                height: 150,
                padding:  const EdgeInsets.all(20),
                decoration:  const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Data.platformPageIndex = 0;
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DashBoard(),),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width/3 - 25,
                              padding:  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Data.themeColors[0],
                                      Data.themeColors[0].withAlpha(100),
                                    ]
                                ),
                                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                              ),
                              child:  const Icon(
                                Icons.home,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/3 - 30,
                              padding:  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:  const Color(0xFF1F1F1F),
                                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Data.themeColors[5],
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    Data.roomsJoined,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Data.themeColors[5],
                                    ),
                                  ),
                                  Text(
                                    'Rooms\nJoined',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Data.themeColors[5],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/3 - 30,
                              padding:  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:  const Color(0xFF1F1F1F),
                                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Data.themeColors[5],
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    Data.roomsCreated,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Data.themeColors[5],
                                    ),
                                  ),
                                  Text(
                                    'Rooms\nCreated',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Data.themeColors[5],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

// arnav gupta