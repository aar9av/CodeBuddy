
import 'dart:math';

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import '../Start/Appbar.dart';
import 'PlatformCard.dart';

class Submission extends StatelessWidget {
  const Submission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[4]),
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
                      Data.themeColors[Data.platformPageIndex],
                      Data.themeColors[Data.platformPageIndex].withAlpha(100),
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
                          Data.platformData[Data.platformPageIndex - 1][0], // Accessing platform name
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const PlatformCard(isPlatform: false)
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
                            Data.themeColors[Data.platformPageIndex],
                            Data.themeColors[Data.platformPageIndex].withAlpha(100),
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
                          itemCount: Data.submissions[Data.platformPageIndex - 1].length,
                          itemBuilder: (context, index) {
                            final submission = Data.submissions[Data.platformPageIndex - 1][index];
                            return SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    submission[0], // Accessing submission name
                                    style: TextStyle(
                                      color: Data.themeColors[5],
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    submission[1], // Accessing submission timestamp
                                    style: TextStyle(
                                      color: Data.themeColors[5],
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
                            onTap: () {},
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Data.themeColors[Data.platformPageIndex],
                                    Data.themeColors[Data.platformPageIndex].withAlpha(100),
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
                                  color: Data.themeColors[5],
                                  width: 2,
                                )),
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
                                    Data.themeColors[Data.platformPageIndex],
                                    Data.themeColors[Data.platformPageIndex].withAlpha(100),
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
