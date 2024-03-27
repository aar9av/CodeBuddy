// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';

import 'Appbar.dart';
import 'PlatformCard.dart';

class Contest extends StatelessWidget {
  final platformIndex;

  // ignore: use_super_parameters
  const Contest({
    Key? key,
    required this.platformIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> searchText = ["Search Leetcode_ID", "Search Codechef_ID", "Search Codeforces_ID"];
    List<Color> themeColor = [const Color(0xFFE7A41F), const Color(0xFF9E8B85), const Color(0xFF2196F3)];
    List<String> platformName = ['LEETCODE', 'CODECHEF', 'CODEFORCES'];
    List<dynamic> contests = [
      [
        ["Weekly Contest 389", "5139", "17, March 2024", "+(13)", "3", "4"],
        ["Biweekly Contest 126", "2185", "16, March 2024", "+(42)", "3", "4"],
        ["Weekly Contest 388", "6101", "10, March 2024", "+(12)", "3", "4"],
      ],
      [
        ["Starters 126 (Div 2)", "1175", "20, March 2024", "-(44)", "2", "7"],
        ["Starters 125 (Div 2)", "243", "13, March 2024", "+(129)", "4", "7"],
        ["Starters 124 (Div 2)", "795", "6, March 2024", "+(35)", "4", "7"],
      ],
      [
        ["Round 935 (Div 3)", "3757", "19, March 2024", "+(328)", "3", "8"],
        ["Round 933 (Div 3)", "11083", "11, March 2024", "+(437)", "3", "7"],
      ]
    ];

    return Scaffold(
      appBar: Appbar(searchBarText: searchText[platformIndex]),
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
                        themeColor[platformIndex],
                        themeColor[platformIndex].withAlpha(100),
                      ]
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
                          platformName[platformIndex],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    PlatformCard(platformIndex: platformIndex, isPlatform: false)
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
                            themeColor[platformIndex],
                            themeColor[platformIndex].withAlpha(100),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          'CONTESTS PARTICIPATED',
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
                        height: 300,
                        child: ListView.builder(
                          itemCount: contests[platformIndex].length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 140,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
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
                                          contests[platformIndex][index][0],
                                          style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text(
                                          contests[platformIndex][index][1],
                                          style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 28,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          contests[platformIndex][index][2],
                                          style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          contests[platformIndex][index][3],
                                          style: TextStyle(
                                            color: getColor(contests[platformIndex][index][3][0][0]),
                                            //color: Theme.of(context).primaryColor,
                                            fontSize: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(
                                        color: Theme.of(context).primaryColor,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Solved ${contests[platformIndex][index][4]}/${contests[platformIndex][index][5]}',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                )
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
                            onTap: () {

                            },
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    themeColor[platformIndex],
                                    themeColor[platformIndex].withAlpha(100),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Center(
                                child: Text(
                                  'PREV',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
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
                                color: Colors.black,
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                )
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    themeColor[platformIndex],
                                    themeColor[platformIndex].withAlpha(100),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Center(
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
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
