// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import 'Dashboard.dart';

class Signup2 extends StatefulWidget {
  final username;
  final email;
  final fullname;
  final password;

  const Signup2({super.key, this.email, this.username, this.fullname, this.password});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  TextEditingController leetcode = TextEditingController();
  TextEditingController codechef = TextEditingController();
  TextEditingController codeforces = TextEditingController();
  TextEditingController bio = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 600,
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        'Here is your \nfirst step with us !!!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    buildTextField(leetcode, 'Leetcode ID', 'Assets/Leetcode.png'),
                    const SizedBox(height: 20),
                    buildTextField(codechef, 'Codechef ID', 'Assets/Codechef.png'),
                    const SizedBox(height: 20),
                    buildTextField(codeforces, 'Codeforces ID', 'Assets/CodeForces.png'),
                    const SizedBox(height: 20),
                    buildTextField(bio, 'Add Bio...', ''),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        Future<bool> chk = Functions.createUser(
                          widget.fullname,
                          widget.email,
                          widget.username,
                          widget.password,
                          leetcode.text,
                          codechef.text,
                          codeforces.text,
                          bio.text,
                        );
                        if(await chk) {
                          setState(() {
                            loading = false;
                          });
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DashBoard(),),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Data.themeColors[4],
                                title: const Text('ALERT'),
                                content: const Text('Failed to create user !!!'),
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
                            'REGISTER',
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

  Widget buildTextField(TextEditingController controller, String labelText, String prefixIcon) {
    return Container(
      height: prefixIcon == '' ? 120 : 50,
      color: Data.themeColors[7],
      child: TextField(
        keyboardType: prefixIcon == '' ? TextInputType.multiline : TextInputType.text,
        maxLines: prefixIcon == '' ? 4 : 1,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon == '' ?
          Icon(
            Icons.dehaze_sharp,
            color: Data.themeColors[8],
          ) :
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(prefixIcon),
          ),
          labelText: labelText,
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
        ),
        style: TextStyle(
          color: Data.themeColors[8],
          fontSize: 18,
        ),
      ),
    );
  }
}
