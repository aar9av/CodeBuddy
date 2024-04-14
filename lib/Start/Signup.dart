import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import 'Signup2.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController pswd = TextEditingController();
  TextEditingController confirmPswd = TextEditingController();
  bool isObsecure = true;
  bool isObsecureCon = true;
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
                  height: 50,
                ),
                Column(
                  children: [
                    buildTextField(fullname, 'Enter Full Name', Icons.account_circle_outlined),
                    const SizedBox(height: 20),
                    buildTextField(email, 'Enter Email', Icons.mail),
                    const SizedBox(height: 20),
                    buildTextField(username, 'Create Username', Icons.person),
                    const SizedBox(height: 20),
                    buildPasswordField(pswd, 'Create Password', isObsecure, (value) {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    }),
                    const SizedBox(height: 20),
                    buildPasswordField(confirmPswd, 'Confirm Password', isObsecureCon, (value) {
                      setState(() {
                        isObsecureCon = !isObsecureCon;
                      });
                    }),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        if(fullname.text.isEmpty) {
                          buildAlertBox('Invalid Name !!!');
                        } else if (username.text.isEmpty) {
                          buildAlertBox('Invalid Username !!!');
                        } else if (pswd.text.isEmpty) {
                          buildAlertBox('Invalid Password !!!');
                        } else if (pswd.text != confirmPswd.text) {
                          buildAlertBox('Password did not match !!!');
                        } else if (await Functions.findUser(username.text, email.text)) {
                          buildAlertBox('Username/Email already exist !!!');
                        } else {
                          setState(() {
                            loading = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Signup2(username: username.text, email: email.text, fullname: fullname.text, password: pswd.text)),
                          );
                        }
                      },
                      child: loading ?
                      CircularProgressIndicator(
                        color: Data.themeColors[9],
                      ) :
                      Container(
                        height: 40,
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
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText, IconData prefixIcon) {
    return Container(
      height: 50,
      color: Data.themeColors[7],
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Data.themeColors[8],
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

  Widget buildPasswordField(TextEditingController controller, String labelText, bool isObscure, void Function(String) onPressed) {
    return Container(
      height: 50,
      color: Data.themeColors[7],
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.key,
            color: Data.themeColors[8],
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
          suffixIcon: IconButton(
            onPressed: () => onPressed(controller.text),
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: Data.themeColors[8],
            ),
          ),
        ),
        style: TextStyle(
          color: Data.themeColors[8],
          fontSize: 18,
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

