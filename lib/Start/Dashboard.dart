// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:codebuddy/Functionalities%20and%20Data/Functions.dart';
import 'package:codebuddy/Profile/SearchedUser.dart';
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Platform/PlatformPage.dart';
import '../Profile/Profile.dart';
import '../Room/Room.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late Widget page = Data.platformPageIndex == 0 ? const Room() : PlatformPage(pageIndex: Data.platformPageIndex);
  late TextEditingController findValue = TextEditingController();
  late final FocusNode _searchFocusNode = FocusNode();
  String searchText = Data.platformPageIndex == 0 ? 'Search Room' : 'Search User';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
        setState(() {
          Data.searchResult = [];
          findValue.clear();
        });
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'Assets/Logo.png',
            ),
          ),
          centerTitle: true,
          title: SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              focusNode: _searchFocusNode,
              keyboardType: TextInputType.text,
              controller: findValue,
              onChanged: (value) {
                Data.platformPageIndex == 0 ? searchRoom(value) : searchUser(value);
              },
              decoration: InputDecoration(
                hintText: isLoading ? 'Searching ...' : searchText,
                hintStyle: TextStyle(
                  color: Data.themeColors[5],
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Data.themeColors[5],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              ),
              style: TextStyle(
                color: Data.themeColors[5],
              ),
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _searchFocusNode.unfocus();
                setState(() {
                  Data.searchResult = [];
                  findValue.clear();
                  isLoading = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
              icon: Image.asset(
                'Assets/Profile.png',
                height: 30,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            page,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Visibility(
                visible: Data.searchResult.isNotEmpty,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Data.themeColors[6].withOpacity(0.9),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    height: min(Data.searchResult.length * 40, 200),
                    child: Container(
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: Data.searchResult.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 40,
                            child: TextButton(
                              onPressed: () async {
                                if(!isLoading) {
                                  _searchFocusNode.unfocus();
                                  setState(() {
                                    isLoading = true;
                                    findValue.clear();
                                  });
                                  await Functions.findUser(
                                      Data.searchResult[index], '####');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (
                                        context) => const SearchedUser()),
                                  ).then((_) {
                                    setState(() {
                                      isLoading = false;
                                      Data.searchResult = [];
                                    });
                                  });
                                }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  Data.searchResult[index],
                                  style: TextStyle(
                                    color: Data.themeColors[5],
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
                    searchText = Data.platformPageIndex == 0 ? 'Search Room' : 'Search User';
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
        ),
      ),
    );
  }

  void searchUser(String value) {
    setState(() {
      Data.searchResult = [];
      for (int i = 0; i < Data.allUsers.length && Data.searchResult.length <= 5; ++i) {
        if (Data.allUsers[i]['username'].contains(value) && Data.searchResult.length <= 5 && value != '') {
          Data.searchResult.add(Data.allUsers[i]['username']);
        }
      }
    });
  }

  void searchRoom(String value) {
    setState(() {
      Data.searchResult = [];
      for (int i = 0; i < Data.allUsers.length && Data.searchResult.length <= 5; ++i) {
        if (Data.allUsers[i]['username'].contains(value) && Data.searchResult.length <= 5 && value != '') {
          Data.searchResult.add(Data.allUsers[i]['username']);
        }
      }
    });
  }
}
