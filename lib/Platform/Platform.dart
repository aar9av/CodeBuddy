// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';
import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import 'Contest.dart';
import 'PlatformCard.dart';
import 'Submission.dart';

class Platform extends StatefulWidget {

  // ignore: use_super_parameters
   const Platform({Key? key}) : super(key: key);


  @override
  State<Platform> createState() => _PlatformState();
}

class _PlatformState extends State<Platform> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height - 170, 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  const EdgeInsets.only(
                  top: 30,
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin:  const EdgeInsets.only(right: 30),
                      padding:  const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius:  const BorderRadius.all(Radius.circular(50)),
                        color: Data.themeColors[5],
                      ),
                      child: Image.asset(
                        Data.platformIcon[Data.platformPageIndex],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          Data.platformData[Data.platformPageIndex -1][0],
                          style: TextStyle(
                            color: Data.themeColors[Data.platformPageIndex],
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Data.platformData[Data.platformPageIndex-1][1],
                          style: TextStyle(
                            color: Data.themeColors[5],
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin:  const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: PlatformCard(isPlatform: true),
              ),
              Container(
                width: double.infinity,
                height: 240,
                decoration:  BoxDecoration(
                  color: Data.themeColors[6],
                  borderRadius: const BorderRadius.only(
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
                            MaterialPageRoute(builder: (context) => const Submission()
                        ));
                      },
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          color:  Data.themeColors[6],
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
                              'Assets/Submissions.png',
                              height: 60,
                            ),
                            Text(
                              'Recent\nSubmissions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Data.themeColors[5],
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
                            MaterialPageRoute(builder: (context) => const Contest()
                        ));
                      },
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          color:  Data.themeColors[6],
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
                              'Assets/Contests.png',
                              height: 60,
                            ),
                            Text(
                              'Contests\nParticipated',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Data.themeColors[5],
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
