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
  bool chkName = true;
  bool chkEmail = true;
  bool chkUsername = true;
  bool chkPswd = true;
  bool chkConPswd = true;
  bool usernameExist = false;
  bool emailExist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
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
                    buildTextField(fullname, 'Enter Full Name', Icons.account_circle_outlined, 'Name cannot be empty !!!', chkName),
                    const SizedBox(height: 20),
                    buildTextField(email, 'Enter Email', Icons.mail, emailExist ? 'Email already exist!!!' : 'Invalid Email !!!', chkEmail),
                    const SizedBox(height: 20),
                    buildTextField(username, 'Create Username', Icons.person, usernameExist ? 'Username already exist!!!' : 'Invalid Username !!!', chkUsername),
                    const SizedBox(height: 20),
                    buildPasswordField(pswd, 'Create Password', isObsecure, (value) {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    }, 'Password cannot be empty !!!', chkPswd),
                    const SizedBox(height: 20),
                    buildPasswordField(confirmPswd, 'Confirm Password', isObsecureCon, (value) {
                      setState(() {
                        isObsecureCon = !isObsecureCon;
                      });
                    }, 'Password does not match!!!', chkConPswd),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () async {
                        if(fullname.text.isEmpty) {
                          setState(() {
                            chkName = false;
                          });
                        } else if (email.text.isEmpty || !email.text.contains('@')) {
                          setState(() {
                            chkName = true;
                            chkEmail = false;
                          });
                        } else if (username.text.isEmpty) {
                          setState(() {
                            chkName = true;
                            chkEmail = true;
                            chkUsername = false;
                          });
                        } else if (pswd.text.isEmpty) {
                          setState(() {
                            chkName = true;
                            chkEmail = true;
                            chkUsername = true;
                            chkPswd = false;
                          });
                        } else if (pswd.text != confirmPswd.text) {
                          setState(() {
                            chkName = true;
                            chkEmail = true;
                            chkUsername = true;
                            chkPswd = true;
                            chkConPswd = false;
                          });
                        } else {
                          setState(() {
                            chkName = true;
                            chkEmail = true;
                            chkUsername = true;
                            chkPswd = true;
                            chkConPswd = true;
                            loading = true;
                          });
                          int chk = await Functions.findUser(username.text, email.text);
                          if (chk == 0) {
                            setState(() {
                              loading = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup2(username: username.text, email: email.text, fullname: fullname.text, password: pswd.text)),
                            );
                          } else if (chk == 1) {
                            setState(() {
                              chkEmail = false;
                              emailExist = true;
                            });
                          } else if (chk == 2) {
                            setState(() {
                              chkEmail = true;
                              emailExist = false;
                              chkUsername = false;
                              usernameExist = true;
                            });
                          } else {
                            setState(() {
                              chkEmail = true;
                              chkUsername = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text(
                                    'Something went wrong !!!\nTry again after some time.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          setState(() {
                            loading = false;
                          });
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

  Widget buildTextField(TextEditingController controller, String labelText, IconData prefixIcon, String errorText, bool error) {
    return Container(
      height: error ? 50 : 70,
      color: Data.themeColors[7],
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          errorText: error ? null : errorText,
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

  Widget buildPasswordField(TextEditingController controller, String labelText, bool isObscure, void Function(String) onPressed, String errorText, bool error) {
    return Container(
      height: error ? 50 : 70,
      color: Data.themeColors[7],
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          errorText: error ? null : errorText,
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
}

