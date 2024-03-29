import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import '../Platform/Platform.dart';
import '../Room/Room.dart';
import 'Appbar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int platformPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[platformPageIndex]),
      body: platformPageIndex == 0 ? const Room() : Platform(platformPageIndex: platformPageIndex),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        color: const Color(0xFF1F1F1F),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Data.themeColors[platformPageIndex],
            ),
            boxShadow: [
              BoxShadow(
                color: Data.themeColors[platformPageIndex],
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              currentIndex: platformPageIndex,
              onTap: (int newPage) {
                setState(() {
                  platformPageIndex = newPage;
                });
              },
              items: List.generate(
                4,
                (index) => BottomNavigationBarItem(
                  icon: Image.asset(
                    Data.platformIcon[index],
                    height: 30,
                    color: index == platformPageIndex ? null : Data.themeColors[5],
                  ),
                  label: '',
                ),
              ),
              selectedItemColor: Data.themeColors[platformPageIndex],
              selectedFontSize: 0,
            ),
          ),
        ),
      )
    );
  }
}
