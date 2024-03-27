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
    
    return Scaffold(
      appBar: Appbar(searchBarText: searchText[platformIndex]),
      body: SingleChildScrollView(
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width) - 80,
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
                    Container(
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
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
