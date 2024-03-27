import 'package:flutter/material.dart';
import 'Appbar.dart';
import 'Platform.dart';
import 'Room.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  List<String> searchText = ["Search Room", "Search Leetcode_ID", "Search Codechef_ID", "Search Codeforces_ID"];
  int currentPage = 0;
  List<Color> navColor = [const Color(0xFF7469B6), const Color(0xFFE7A41F), const Color(0xFF9E8B85), const Color(0xFF2196F3)];
  List<String> labelText = ['Room', 'Leetcode', 'Codechef', 'CodeForces'];
  List<String> navIcon = ['Assets/Home.png', 'Assets/Leetcode.png', 'Assets/Codechef.png', 'Assets/CodeForces.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: searchText[currentPage]),
      body: currentPage == 0 ? const Room() : Platform(platformIndex: currentPage.toInt() - 1),
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
              color: navColor[currentPage],
            ),
            boxShadow: [
              BoxShadow(
                color: navColor[currentPage],
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              currentIndex: currentPage,
              onTap: (int newPage) {
                setState(() {
                  currentPage = newPage;
                });
              },
              items: List.generate(
                4,
                (index) => BottomNavigationBarItem(
                  icon: Image.asset(
                    navIcon[index],
                    height: 30,
                    color: index == currentPage ? null : Theme.of(context).primaryColor,
                  ),
                  label: labelText[index],
                ),
              ),
              selectedItemColor: navColor[currentPage],
              selectedFontSize: 0,
            ),
          ),
        ),
      )
    );
  }
}
