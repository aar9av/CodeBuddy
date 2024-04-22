// ignore_for_file: prefer_typing_uninitialized_variables, use_super_parameters

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Functionalities and Data/Data.dart';
import 'PlatformCard.dart';

class Contest extends StatefulWidget {
  
  const Contest({Key? key}) : super(key: key);

  @override
  State<Contest> createState() => _ContestState();
}

class _ContestState extends State<Contest> {
  List<dynamic> x = Data.contests[Data.platformPageIndex-1];
  int currPage = 1;

  @override
  Widget build(BuildContext context) {
    int n = x.length;
    List<dynamic> contests = [];
    for(int i=0; i<n/2+1; ++i) {
      List<dynamic> temp = [];
      for(int j=0; j<2 && i*2+j<n ;++j) {
        temp.add(x[i*2+j]);
      }
      if(temp.isNotEmpty) {
        contests.add(temp);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: max(MediaQuery.of(context).size.height, 760),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
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
                          Data.platformData[Data.platformPageIndex - 1][0],
                          style: TextStyle(
                            color: Data.themeColors[7],
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
                height: 500,
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
                    Container(
                      height: 400,
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: contests.isEmpty ? 0 : contests[currPage - 1].length,
                        itemBuilder: (context, index) {
                          final contest = contests[currPage - 1][index];
                          return GestureDetector(
                            onTap: () async{
                              Uri url = Uri.parse(contest['contest']['url'] ?? '');
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch');
                              }
                            },
                            child: Container(
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
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width - 120,
                                        child: Text(
                                          contest['contest']['title'] ?? '',
                                          style: TextStyle(
                                            color: Data.themeColors[5],
                                            fontSize: 24,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        contest['final_rating'].toString() ?? '',
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${contest['contest']['start_time'].substring(8,10) ?? ''}/${contest['contest']['start_time'].substring(5,7) ?? ''}/${contest['contest']['start_time'].substring(2,4) ?? ''}',
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        contest['rating_change']<0 ? '- (${-1*contest['rating_change']})' : '+ (${contest['rating_change']})' ?? '',
                                        style: TextStyle(
                                          color: contest['rating_change'] < 0 ? Colors.red : Colors.green,
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Data.themeColors[5],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Solved ${contest['number_of_problems_solved'] ?? ''}/${contest['contest']['total_questions'] ?? ''}',
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        contest['rank'].toString() ?? '',
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 24,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 170,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(currPage>1) {
                                setState(() {
                                  currPage--;
                                });
                              }
                            },
                            child: Container(
                              height: currPage > 1 ? 28 : 26,
                              width: currPage > 1 ? 60 : 58,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      currPage>1 ? Data.themeColors[Data.platformPageIndex] : Data.themeColors[6],
                                      currPage>1 ? Data.themeColors[Data.platformPageIndex].withAlpha(100) : Data.themeColors[6],
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: currPage>1 ? Data.themeColors[6] : Data.themeColors[5],
                                    width: 1,
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  'Prev',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: currPage>1 ? Data.themeColors[7] : Data.themeColors[5],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                color: Data.themeColors[6],
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  color: Data.themeColors[5],
                                  width: 1,
                                )
                            ),
                            child: Center(
                              child: Text(
                                currPage.toString(),
                                style: TextStyle(
                                  color: Data.themeColors[5],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if(currPage<contests.length) {
                                setState(() {
                                  currPage++;
                                });
                              }
                            },
                            child: Container(
                              height: currPage<contests.length ? 28 : 26,
                              width: currPage<contests.length ? 60 : 58,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      currPage<contests.length ? Data.themeColors[Data.platformPageIndex] : Data.themeColors[6],
                                      currPage<contests.length ? Data.themeColors[Data.platformPageIndex].withAlpha(100) : Data.themeColors[6],
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: currPage<contests.length ? Data.themeColors[6] : Data.themeColors[5],
                                    width: 1,
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: currPage<contests.length ? Data.themeColors[7] : Data.themeColors[5],
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
