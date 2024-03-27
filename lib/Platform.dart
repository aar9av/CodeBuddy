// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';
import 'package:code_buddy/PlatformCard.dart';
import 'package:flutter/material.dart';

import 'Contest.dart';
import 'Submission.dart';

class Platform extends StatefulWidget {
  final platformIndex;

  // ignore: use_super_parameters
  const Platform({
    Key? key,
    required this.platformIndex,
  }) : super(key: key);


  @override
  State<Platform> createState() => _PlatformState();
}

class _PlatformState extends State<Platform> {
  List<String> platformIcon = ['Assets/Leetcode.png', 'Assets/Codechef.png', 'Assets/CodeForces.png'];
  List<String> platformName = ['Leetcode', 'Codechef', 'Codeforces'];
  List<String> platformUsername= ["@aar9av", "@aar9av", "@aar9av"];
  List<Color> themeColor = [const Color(0xFFE7A41F), const Color(0xFF9E8B85), const Color(0xFF2196F3)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width) - 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(right: 30),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Image.asset(
                        platformIcon[widget.platformIndex],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          platformName[widget.platformIndex],
                          style: TextStyle(
                            color: themeColor[widget.platformIndex],
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          platformUsername[widget.platformIndex],
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: PlatformCard(platformIndex: widget.platformIndex, isPlatform: true),
              ),
              Container(
                width: double.infinity,
                height: 240,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Submission(platformIndex: widget.platformIndex))
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F1F1F),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor,
                              spreadRadius: 1,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'Assets/Logo.png',
                              height: 60,
                            ),
                            Text(
                              'Recent\nSubmissions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Contest(platformIndex: widget.platformIndex))
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F1F1F),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor,
                              spreadRadius: 1,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'Assets/Contests.png',
                              height: 60,
                            ),
                            Text(
                              'Contests\nParticipated',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
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
      )
    );
  }
}
