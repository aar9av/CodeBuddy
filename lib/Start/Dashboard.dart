import 'package:codebuddy/Platform/PlatformPage.dart';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Room/Room.dart';
import 'Appbar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Widget page = Data.platformPageIndex == 0 ? const Room() : PlatformPage(pageIndex: Data.platformPageIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[Data.platformPageIndex]),
      body: page,
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
              color: Data.themeColors[Data.platformPageIndex],
            ),
            boxShadow: [
              BoxShadow(
                color: Data.themeColors[Data.platformPageIndex],
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              currentIndex: Data.platformPageIndex,
              onTap: (int newPage) {
                setState(() {
                  Data.platformPageIndex = newPage;
                  page = Data.platformPageIndex == 0 ? const Room() : PlatformPage(pageIndex: Data.platformPageIndex);
                });
              },
              items: List.generate(
                4,
                (index) => BottomNavigationBarItem(
                  icon: Image.asset(
                    Data.platformIcon[index],
                    height: 30,
                    color: index == Data.platformPageIndex ? null : Data.themeColors[5],
                  ),
                  label: '',
                ),
              ),
              selectedItemColor: Data.themeColors[Data.platformPageIndex],
              selectedFontSize: 0,
            ),
          ),
        ),
      )
    );
  }
}
