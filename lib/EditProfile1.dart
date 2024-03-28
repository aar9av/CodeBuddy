import 'package:code_buddy/Appbar.dart';
import 'package:flutter/material.dart';

import 'EditProfile2.dart';

class EditProfile1 extends StatelessWidget {
  const EditProfile1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController userName = TextEditingController();
    TextEditingController bio = TextEditingController();
    String userFullName = 'Arnav Gupta';
    String userUserName = "@aar9av";
    String userEmail = "aar9av@gmail.com";
    String userBio = "Ram Ram Bhai Sarayane,\nAaj hai hamara project banane ka doosra din,\nAur ham abhi kam kr rhe hai figma design pr...";

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
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: fullName,
                          decoration: InputDecoration(
                            hintText: userFullName,
                            hintStyle: const TextStyle(
                              color: Color(0xFF9DB2BF),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9DB2BF)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9DB2BF)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF9DB2BF),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: userName,
                          decoration: InputDecoration(
                            hintText: userUserName,
                            hintStyle: const TextStyle(
                              color: Color(0xFF9DB2BF),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9DB2BF)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9DB2BF)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF9DB2BF),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: userEmail,
                            hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF9DB2BF),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          controller: bio,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: userBio,
                            hintStyle: const TextStyle(
                              color: Color(0xFF9DB2BF),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9DB2BF)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9DB2BF)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF9DB2BF),
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
                                  'CANCEL',
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile2(),));
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
                                  'NEXT',
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
