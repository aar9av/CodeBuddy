// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';

class PlatformCard extends StatelessWidget {
  final platformPageIndex;
  final isPlatform;

   const PlatformCard({
    super.key,
     required this.platformPageIndex,
    required this.isPlatform,
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
                (isPlatform ? Data.themeColors[platformPageIndex] : Data.themeColors[7]),
                (isPlatform ? Data.themeColors[platformPageIndex] : Data.themeColors[7]).withAlpha(100),
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
                  'Global Rank',
                  style: TextStyle(
                    color: isPlatform ? Data.themeColors[4] : Data.themeColors[5],
                    fontSize: 24,
                  ),
                ),
                Text(
                  Data.platformData[platformPageIndex - 1][2],
                  style: TextStyle(
                    color: isPlatform ? Data.themeColors[4] : Data.themeColors[5],
                    fontSize: 28,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Data.platformData[platformPageIndex - 1][3]} Contests Participated',
                  style: TextStyle(
                    color: isPlatform ? Data.themeColors[4] : Data.themeColors[5],
                    fontSize: 15,
                  ),
                ),
                Text(
                  Data.platformData[platformPageIndex - 1][4],
                  style: TextStyle(
                    color: isPlatform ? Data.themeColors[4] : Data.themeColors[5],
                    fontSize: 24,
                  ),
                )
              ],
            ),
            Divider(
              color: isPlatform ? Data.themeColors[4] : Data.themeColors[5],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${Data.platformData[platformPageIndex - 1][5]} Questions Solved',
                style: TextStyle(
                  color: isPlatform ? Data.themeColors[4] : Data.themeColors[5],
                  fontSize: 15,
                ),
              ),
            )
          ],
        )
    );
  }
}
