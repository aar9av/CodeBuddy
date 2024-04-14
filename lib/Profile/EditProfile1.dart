import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import '../Start/Appbar.dart';
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
  TextEditingController oldPswd = TextEditingController();
  TextEditingController newPswd = TextEditingController();
  TextEditingController conPawd = TextEditingController();
  bool isObsecureOldPawd = true;
  bool isObsecureNewPawd = true;
  bool isObsecureConPawd = true;
  bool isPswd = false;
  bool loading = false;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(searchBarText: Data.searchBarText[6]),
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
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Data.themeColors[7],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 550,
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
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit Basic Info :',
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 20,
                          ),
                        ),
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
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: userName.text.isEmpty ? 'Enter Username' : null,
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
                        height: 40,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: InputDecoration(
                            hintText: email.text.isEmpty ? 'Enter Email Address' : null,
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
                      Divider(color: Data.themeColors[5],),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Change Password :',
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        color: Data.themeColors[7],
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObsecureOldPawd,
                          controller: oldPswd,
                          decoration: InputDecoration(
                            hintText: 'Enter Old Password',
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
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObsecureOldPawd = !isObsecureOldPawd;
                                });
                              },
                              icon: Icon(
                                isObsecureOldPawd ? Icons.visibility : Icons.visibility_off,
                                color: Data.themeColors[0],
                              ),
                            ),
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
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObsecureNewPawd,
                          controller: newPswd,
                          decoration: InputDecoration(
                            hintText: 'Create New Password',
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
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObsecureNewPawd = !isObsecureNewPawd;
                                });
                              },
                              icon: Icon(
                                isObsecureNewPawd ? Icons.visibility : Icons.visibility_off,
                                color: Data.themeColors[0],
                              ),
                            ),
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
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isObsecureConPawd,
                          controller: conPawd,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
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
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObsecureConPawd = !isObsecureConPawd;
                                });
                              },
                              icon: Icon(
                                isObsecureConPawd ? Icons.visibility : Icons.visibility_off,
                                color: Data.themeColors[0],
                              ),
                            ),
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
                            onTap: () async {
                              setState(() {
                                loading = true;
                              });
                              if(fullName.text.isEmpty) {
                                buildAlertBox('Invalid Name !!!');
                              } else if (userName.text.isEmpty) {
                                buildAlertBox('Invalid Username !!!');
                              } else if (await Functions.findUser('####', email.text) && email.text != Data.email) {
                                buildAlertBox('Email already exist !!!');
                              } else if(oldPswd.text.isNotEmpty) {
                                if(await Functions.auth(Data.username, oldPswd.text)) {
                                  if(newPswd.text.isEmpty) {
                                    buildAlertBox('Password can not be empty !!!');
                                  } else if (newPswd.text != conPawd.text) {
                                    buildAlertBox('Password did not match !!!');
                                  } else {
                                    setState(() {
                                      isPswd = true;
                                      loading = false;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile2(fullName: fullName.text, username: userName.text, email: email.text, pswd: newPswd.text, isPswd: isPswd)
                                      ),
                                    );
                                  }
                                } else {
                                  buildAlertBox('Invalid Password !!!');
                                }
                              } else {
                                setState(() {
                                  loading = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile2(fullName: fullName.text, username: userName.text, email: email.text, pswd: newPswd.text, isPswd: isPswd)
                                  ),
                                );
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

  Future buildAlertBox(String s) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Data.themeColors[4],
          title: const Text('ALERT'),
          content: Text(s),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  loading = false;
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
