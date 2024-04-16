// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import 'Dashboard.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController pswd = TextEditingController();
  bool isObsecure = true;
  bool credentials = true;
  bool chkUsername = true;
  bool chkPswd = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 600,
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'Assets/Logo.png',
                      height: 80,
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Colors.yellow, Colors.cyan, Colors.blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'Welcome Back !!!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: chkUsername ? 50 : 70,
                      color: Data.themeColors[7],
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                          errorText: chkUsername ? null : 'Invalid User !!!',
                          errorStyle: const TextStyle(
                            color: Colors.redAccent,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Data.themeColors[8]),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Data.themeColors[8],
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            color: Data.themeColors[8],
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Data.themeColors[8]),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Data.themeColors[8]),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        style: TextStyle(
                          color: Data.themeColors[8],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: chkPswd ? 50 : 70,
                      color: Data.themeColors[7],
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObsecure,
                        controller: pswd,
                        decoration: InputDecoration(
                          errorText: chkPswd ? null : "Invalid Password !!!",
                          errorStyle: const TextStyle(
                            color: Colors.redAccent,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Data.themeColors[8]),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                            prefixIcon: Icon(
                              Icons.key,
                              color: Data.themeColors[8],
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Data.themeColors[8],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Data.themeColors[8]),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Data.themeColors[8]),
                            ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            icon: Icon(
                              isObsecure ? Icons.visibility : Icons.visibility_off,
                              color: Data.themeColors[8],
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Data.themeColors[8],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () async{
                        if(username.text.isEmpty) {
                          setState(() {
                            chkUsername = false;
                          });
                        } else if(pswd.text.isEmpty) {
                          setState(() {
                            chkUsername = true;
                            chkPswd = false;
                          });
                        } else {
                          setState(() {
                            loading = true;
                            chkUsername = true;
                            chkPswd = true;
                          });
                          int chk = await Functions.auth(username.text, pswd.text);
                          if(chk == 0) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const DashBoard(),)
                            );
                          } else if (chk == 1) {
                            setState(() {
                              chkUsername = false;
                            });
                          } else if (chk == 2) {
                            setState(() {
                              chkUsername = true;
                              chkPswd = false;
                            });
                          } else {
                            setState(() {
                              chkUsername = true;
                              chkPswd = true;
                            });
                            const snackBar = SnackBar(
                              content: Center(
                                child: Text(
                                  'Something went wrong !!!\nTry again after some time.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      child: loading ?
                      CircularProgressIndicator(
                        color: Data.themeColors[9],
                      ):
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Data.themeColors[9],
                              Data.themeColors[8],
                              Data.themeColors[8],
                            ],
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: const Center(
                          child: Text(
                            'LOGIN',
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
        ),
      ),
    );
  }
}
