// ignore_for_file: prefer_typing_uninitialized_variables, use_super_parameters

import 'dart:math';

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import '../Start/Appbar.dart';
import 'PlatformCard.dart';

class Contest extends StatelessWidget {
  final platformPageIndex;
  
  const Contest({Key? key, this.platformPageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[5]),
      body: SingleChildScrollView(
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height - 190, 700),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Data.themeColors[platformPageIndex],
                      Data.themeColors[platformPageIndex].withAlpha(100),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          Data.platformData[platformPageIndex - 1][0],
                          style: TextStyle(
                            color: Data.themeColors[7],
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    PlatformCard(platformPageIndex: platformPageIndex, isPlatform: false)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 460,
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
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Data.themeColors[platformPageIndex],
                            Data.themeColors[platformPageIndex].withAlpha(100),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          'CONTESTS PARTICIPATED',
                          style: TextStyle(
                            color: Data.themeColors[7],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: Data.contests[platformPageIndex - 1].length,
                          itemBuilder: (context, index) {
                            final contest = Data.contests[platformPageIndex - 1][index];
                            return Container(
                              height: 140,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: Data.themeColors[7],
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: Data.themeColors[5],
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        contest[0], // Accessing contest name
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        contest[1], // Accessing contest date
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 28,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        contest[2], // Accessing contest type
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        contest[3],
                                        style: TextStyle(
                                          color: getColor(contest[3][0]), // Pass the rating graph to getColor function
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Data.themeColors[5],
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Solved ${contest[4]}/${contest[5]}',
                                      style: TextStyle(
                                        color: Data.themeColors[5],
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Data.themeColors[platformPageIndex],
                                    Data.themeColors[platformPageIndex].withAlpha(100),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'PREV',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Data.themeColors[7],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Data.themeColors[7],
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  color: Data.themeColors[5],
                                  width: 2,
                                )
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Data.themeColors[5],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Data.themeColors[platformPageIndex],
                                    Data.themeColors[platformPageIndex].withAlpha(100),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Data.themeColors[7],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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

  Color getColor(String ratingGraph) {
    return ratingGraph == '+' ? Colors.green : Colors.red;
  }
}
