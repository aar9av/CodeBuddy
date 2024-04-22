
// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import 'PlatformCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Submission extends StatefulWidget {
  
  const Submission({super.key});

  @override
  State<Submission> createState() => _SubmissionState();
}

class _SubmissionState extends State<Submission> {
  List<dynamic> x = Data.submissions[Data.platformPageIndex-1];
  int currPage = 1;

  @override
  Widget build(BuildContext context) {
    int n = x.length;
    List<dynamic> submissions = [];
    for(int i=0; i<n/9+1; ++i) {
      List<dynamic> temp = [];
      for(int j=0; j<9 && i*9+j<n ;++j) {
        temp.add(x[i*9+j]);
      }
      if(temp.isNotEmpty) {
        submissions.add(temp);
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
                    Container(
                      height: 400,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView.builder(
                        itemCount: submissions.isEmpty ? 0 : submissions[currPage - 1].length,
                        itemBuilder: (context, index) {
                          final submission = submissions[currPage - 1][index];
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () async{
                                      Uri url = Uri.parse(submission['submission_link'] ?? '');
                                      if (!await launchUrl(url)) {
                                        throw Exception('Could not launch');
                                      }
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width - 110,
                                      child: Text(
                                        submission['problem'] ?? '',
                                        style: TextStyle(
                                          color: Data.themeColors[5],
                                          fontSize: 18,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${submission['submitted_at'].substring(8,10) ?? ''}/${submission['submitted_at'].substring(5,7) ?? ''}/${submission['submitted_at'].substring(2,4) ?? ''}',
                                    style: TextStyle(
                                      color: Data.themeColors[5],
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Data.themeColors[5],),
                            ],
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
                              if(currPage<submissions.length) {
                                setState(() {
                                  currPage++;
                                });
                              }
                            },
                            child: Container(
                              height: currPage<submissions.length ? 28 : 26,
                              width: currPage<submissions.length ? 60 : 58,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      currPage<submissions.length ? Data.themeColors[Data.platformPageIndex] : Data.themeColors[6],
                                      currPage<submissions.length ? Data.themeColors[Data.platformPageIndex].withAlpha(100) : Data.themeColors[6],
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: currPage<submissions.length ? Data.themeColors[6] : Data.themeColors[5],
                                    width: 1,
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: currPage<submissions.length ? Data.themeColors[7] : Data.themeColors[5],
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
