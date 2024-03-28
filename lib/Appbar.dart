// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'Profile.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  final searchBarText;

  const Appbar({
    super.key,
    required this.searchBarText,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    TextEditingController findValue = TextEditingController();

    return AppBar(
      toolbarHeight: 50,
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'Assets/Submissions.png',
        ),
      ),
      centerTitle: true,
      title: SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          keyboardType: TextInputType.text,
          controller: findValue,
          decoration: InputDecoration(
            hintText: searchBarText,
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          ),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            if(searchBarText != 'Search User') {
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
    );
  }
}
