import 'package:flutter/material.dart';

class PlatformCard extends StatelessWidget {
  final platformIndex;
  final isPlatform;

  const PlatformCard({
    super.key,
    required this.platformIndex,
    required this.isPlatform,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> themeColor = [const Color(0xFFE7A41F), const Color(0xFF9E8B85), const Color(0xFF2196F3)];
    List<dynamic> platformData = [["128896", "19", "1762", "423"], ["5097", "4", "1799", "15"], ["Newbie", "2", "765", "6"]];
    Color cardColor = isPlatform ? themeColor[platformIndex] : Colors.black;
    Color textColor = isPlatform ? Colors.white : Theme.of(context).primaryColor;

    return Container(
        height: 140,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                cardColor,
                cardColor.withAlpha(100),
              ]
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    color: textColor,
                    fontSize: 24,
                  ),
                ),
                Text(
                  platformData[platformIndex][0],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 28,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${platformData[platformIndex][1]} Contests Participated',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                  ),
                ),
                Text(
                  platformData[platformIndex][2],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                  ),
                )
              ],
            ),
            Divider(
              color: textColor,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${platformData[platformIndex][3]} Questions Solved',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                ),
              ),
            )
          ],
        )
    );
  }
}
