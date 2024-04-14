
// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Start/Appbar.dart';
import 'PlatformCard.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        height: 360,
                        child: ListView.builder(
                          itemCount: Data.submissions[Data.platformPageIndex - 1].length,
                          itemBuilder: (context, index) {
                            final submission = Data.submissions[Data.platformPageIndex - 1][index];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async{
                                        Uri url = Uri.parse(submission['url']);
                                        if (!await launchUrl(url)) {
                                          throw Exception('Could not launch');
                                        }
                                      },
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width - 90,
                                        child: Text(
                                          submission['title'],
                                          style: TextStyle(
                                            color: Data.themeColors[5],
                                            fontSize: 18,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      submission['last_edited_at'].substring(11, 16),
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
