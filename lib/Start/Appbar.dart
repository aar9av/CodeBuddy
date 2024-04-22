import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import '../Profile/Profile.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final searchBarText;

  const Appbar({
    super.key,
    required this.searchBarText,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  TextEditingController findValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
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
            keyboardType: TextInputType.text,
            controller: findValue,
            onChanged: (value) {
              searchValue(value);
            },
            decoration: InputDecoration(
              hintText: widget.searchBarText,
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
              if (widget.searchBarText != 'Search User') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              }
            },
            icon: Image.asset(
              'Assets/Profile.png',
              height: 30,
            ),
          ),
        ],
      ),

    );
  }

  void searchValue(String value) {
    setState(() {
      Data.searchResult = [];
      for (int i = 0; i < Data.allUsers.length && Data.searchResult.length <= 5; ++i) {
        if (Data.allUsers[i]['username'].contains(value) && Data.searchResult.length <= 5 && value != '') {
          Data.searchResult.add(Data.allUsers[i]['username']);
        }
      }
      print(Data.searchResult);
    });
  }
}
