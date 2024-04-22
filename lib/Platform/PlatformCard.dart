// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';

class PlatformCard extends StatelessWidget {
  final isPlatform;
  final pageIndex;

  const PlatformCard({
    super.key,
    required this.isPlatform, this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 140,
        width: double.infinity,
        padding:  const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                (isPlatform ? Data.themeColors[Data.platformPageIndex] : Data.themeColors[7]),
                (isPlatform ? Data.themeColors[Data.platformPageIndex] : Data.themeColors[7]).withAlpha(100),
              ]
          ),
          borderRadius:  const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Contest Rating',
                  style: TextStyle(
                    color: Data.themeColors[4],
                    fontSize: 24,
                  ),
                ),
                Text(
                  Data.platformData[Data.platformPageIndex - 1][2],
                  style: TextStyle(
                    color: Data.themeColors[4],
                    fontSize: 28,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Data.platformData[Data.platformPageIndex - 1][3]} Contests',
                  style: TextStyle(
                    color: Data.themeColors[4],
                    fontSize: 15,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: Data.platformData[Data.platformPageIndex - 1][4] == '' ? 0 : 24,
                  decoration: BoxDecoration(
                    color: Data.themeColors[4],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    Data.platformData[Data.platformPageIndex - 1][4],
                    style: TextStyle(
                      color: Functions.getBadgeColor(Data.platformData[Data.platformPageIndex - 1][4]),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: Data.themeColors[4],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Data.platformData[Data.platformPageIndex - 1][5]} Questions Solved',
                  style: TextStyle(
                    color: Data.themeColors[4],
                    fontSize: 15,
                  ),
                ),
                Text(
                  Data.platformData[Data.platformPageIndex - 1][6],
                  style: TextStyle(
                    color: Data.themeColors[4],
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}