// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:code_buddy/PlatformCard.dart';
import 'package:flutter/material.dart';

import 'Appbar.dart';

class Submission extends StatelessWidget {
  final platformIndex;

  // ignore: use_super_parameters
  const Submission({
    Key? key,
    required this.platformIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> searchText = ["Search Leetcode_ID", "Search Codechef_ID", "Search Codeforces_ID"];
    List<Color> themeColor = [const Color(0xFFE7A41F), const Color(0xFF9E8B85), const Color(0xFF2196F3)];
    List<String> platformName = ['LEETCODE', 'CODECHEF', 'CODEFORCES'];
    List<dynamic> submissions = [
      [
        ["N Queen", "2 Days ago"],
        ["Rat in a Maze", "2 Days ago"],
        ["Sudoku Solver", "2 Days ago"],
        ["Tower of Hanoi", "2 Days ago"],
        ["Word Break", "2 Days ago"],
        ["Sort Stack", "2 Days ago"],
        ["Palindrome Partitioning", "2 Days ago"],
        ["Number of Islands", "2 Days ago"],
        ["Flood Fill", "2 Days ago"],
        ["Word Search", "2 Days ago"],
      ],
      [
        ["N Queen", "2 Days ago"],
        ["Rat in a Maze", "2 Days ago"],
        ["Sudoku Solver", "2 Days ago"],
        ["Tower of Hanoi", "2 Days ago"],
        ["Word Break", "2 Days ago"],
        ["Sort Stack", "2 Days ago"],
        ["Palindrome Partitioning", "2 Days ago"],
        ["Number of Islands", "2 Days ago"],
      ],
      [
        ["Flood Fill", "2 Days ago"],
        ["Word Search", "2 Days ago"],
        ["N Queen", "2 Days ago"],
        ["Rat in a Maze", "2 Days ago"],
        ["Sudoku Solver", "2 Days ago"],
        ["Tower of Hanoi", "2 Days ago"],
        ["Word Break", "2 Days ago"],
        ["Sort Stack", "2 Days ago"],
        ["Palindrome Partitioning", "2 Days ago"],
        ["Number of Islands", "2 Days ago"],
        ["Flood Fill", "2 Days ago"],
        ["Word Search", "2 Days ago"],
      ],
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
                          'RECENT SUBMISSIONS',
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
                          itemCount: submissions[platformIndex].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    submissions[platformIndex][index][0],
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    submissions[platformIndex][index][1],
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
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
}
