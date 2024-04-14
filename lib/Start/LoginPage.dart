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
                      height: 50,
                      color: Data.themeColors[7],
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: username,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Data.themeColors[8],
                            ),
                            labelText: 'Username',
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
                            )
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
                      height: 50,
                      color: Data.themeColors[7],
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObsecure,
                        controller: pswd,
                        decoration: InputDecoration(
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
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        if(username.text.isNotEmpty && pswd.text.isNotEmpty) {
                          setState(() {
                            credentials = true;
                          });
                          Future<bool> authenticate = Functions.auth(username.text, pswd.text);
                          if(await authenticate) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashBoard()),
                            );
                          } else {
                            setState(() {
                              credentials = false;
                            });
                          }
                        } else {
                          setState(() {
                            credentials = false;
                          });
                        }
                        if(!credentials) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Data.themeColors[4],
                                title: const Text('ALERT'),
                                content: const Text('Wrong Credentials !!!'),
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
