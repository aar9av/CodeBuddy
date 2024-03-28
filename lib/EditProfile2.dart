import 'package:flutter/material.dart';

import 'Appbar.dart';
import 'Profile.dart';

class EditProfile2 extends StatelessWidget {
  const EditProfile2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController leetcodeUserName = TextEditingController();
    TextEditingController codechefUserName = TextEditingController();
    TextEditingController codeforcesUserName = TextEditingController();
    String userLeetcodeUserName = "@aar9av";
    String userCodechefUserName = "@aar9av";
    String userCodeforcesUserName = "@aar9av";

    return Scaffold(
        appBar: const Appbar(searchBarText: 'Search User'),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF9DB2BF),
                      const Color(0xFF9DB2BF).withAlpha(100),
                    ]
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 450,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1F1F1F),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).primaryColor,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'Assets/Leetcode.png',
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1F1F1F),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).primaryColor,
                                    spreadRadius: 0.2,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'Assets/Codechef.png',
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1F1F1F),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).primaryColor,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'Assets/CodeForces.png',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          color: Colors.black,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: leetcodeUserName,
                            decoration: InputDecoration(
                              hintText: userLeetcodeUserName,
                              hintStyle: const TextStyle(
                                color: Color(0xFFE7A41F),
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE7A41F)),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE7A41F)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            ),
                            style: const TextStyle(
                              color: Color(0xFFE7A41F),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.black,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: codechefUserName,
                            decoration: InputDecoration(
                              hintText: userCodechefUserName,
                              hintStyle: const TextStyle(
                                color: Color(0xFF9E8B85),
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF9E8B85)),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF9E8B85)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            ),
                            style: const TextStyle(
                              color: Color(0xFF9E8B85),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          color: Colors.black,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            controller: codeforcesUserName,
                            decoration: InputDecoration(
                              hintText: userCodeforcesUserName,
                              hintStyle: const TextStyle(
                                color: Color(0xFF2196F3),
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF2196F3)),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF2196F3)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                            ),
                            style: const TextStyle(
                              color: Color(0xFF2196F3),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width / 2 - 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF9DB2BF),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'BACK',
                                    style: TextStyle(
                                      color: Color(0xFF9DB2BF),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile(),));
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width / 2 - 40,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFF9DB2BF),
                                      const Color(0xFF9DB2BF).withAlpha(100),
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                                child: const Center(
                                  child: Text(
                                    'SAVE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
