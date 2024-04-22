// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import '../Start/Dashboard.dart';

class EditProfile2 extends StatefulWidget {
  final String? fullName;
  final String? username;
  final String? email;
  final String? pswd;
  final bool? isPswd;

  const EditProfile2({super.key, this.fullName, this.username, this.pswd, this.email, this.isPswd});

  @override
  State<EditProfile2> createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  TextEditingController leetcodeUserName = TextEditingController();
  TextEditingController codechefUserName = TextEditingController();
  TextEditingController codeforcesUserName = TextEditingController();
  TextEditingController bio = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    setState(() {
      leetcodeUserName.text = Data.leetcodeUsername;
      codechefUserName.text = Data.codechefUsername;
      codeforcesUserName.text = Data.codeforcesUsername;
      bio.text = Data.bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 550,
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
                                  color: Data.themeColors[5],
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
                                  color: Data.themeColors[5],
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
                                  color: Data.themeColors[5],
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
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: leetcodeUserName,
                          decoration: InputDecoration(
                            hintText: leetcodeUserName.text.isEmpty ? 'Enter Leetcode Username' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[1],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[1]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[1]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[1],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: codechefUserName,
                          decoration: InputDecoration(
                            hintText: codechefUserName.text.isEmpty ? 'Enter Codechef Username' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[2],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[2]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[2]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[2],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: codeforcesUserName,
                          decoration: InputDecoration(
                            hintText: codeforcesUserName.text.isEmpty ? 'Enter Codeforces Username' : null,
                            hintStyle: TextStyle(
                              color: Data.themeColors[3],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[3]),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[3]),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[3],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Divider(color: Data.themeColors[5],),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit Bio :',
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 20,
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
                                  'BACK',
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
                            onTap: () async {
                              setState(() {
                                loading = true;
                              });
                              Future<bool> chk = Functions.updateUser(
                                  widget.username.toString(),
                                  widget.email.toString(),
                                  widget.fullName.toString(),
                                  leetcodeUserName.text,
                                  codechefUserName.text,
                                  codeforcesUserName.text,
                                  bio.text,
                                  widget.isPswd,
                                  widget.pswd.toString(),
                              );
                              if(await chk) {
                                setState(() {
                                  loading = false;
                                });
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DashBoard(),)
                                );
                              } else {
                                showSnack('Unable to update data !!!');
                              }
                            },
                            child: loading ?
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Data.themeColors[0],
                                ),
                              ),
                            ) :
                            Container(
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
      ),
    );
  }

  void showSnack(String error) {
    final snackBar = SnackBar(
      content: Center(
        child: Text(
          error,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
