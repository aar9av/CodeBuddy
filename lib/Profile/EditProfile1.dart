import 'package:code_buddy/Start/Appbar.dart';
import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import 'EditProfile2.dart';

class EditProfile1 extends StatefulWidget {
  const EditProfile1({super.key});

  @override
  State<EditProfile1> createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile1> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController bio = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    setState(() {
      fullName.text = Data.name;
      userName.text = Data.username;
      email.text = Data.email;
      bio.text = Data.bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[6]),
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
                  Data.themeColors[0],
                  Data.themeColors[0].withAlpha(100),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Data.themeColors[7],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 450,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Data.themeColors[6],
                    borderRadius: const BorderRadius.only(
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
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: fullName,
                          decoration: InputDecoration(
                            hintText: fullName.text.isEmpty ? 'Enter Full Name' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: userName,
                          decoration: InputDecoration(
                            hintText: userName.text.isEmpty ? 'Enter Username' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: email.text.isEmpty ? 'Enter Email Address' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[5],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[5]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[5]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[5],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          controller: bio,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: bio.text.isEmpty ? 'Add Bio ...' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[0],
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
                                  color: Data.themeColors[0],
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    color: Data.themeColors[0],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditProfile2(fullName: fullName.text, username: userName.text, bio: bio.text),
                                  ),
                              );
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Data.themeColors[0],
                                    Data.themeColors[0].withAlpha(100),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                    color: Data.themeColors[7],
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
      ),
    );
  }
}
