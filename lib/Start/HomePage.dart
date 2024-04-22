
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'Signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  height: 100,
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
                    '</CodeBuddy>',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "More than code, it's a conversation.",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup(),),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/2 - 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellowAccent,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Colors.yellow, Colors.lightGreenAccent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/2 - 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyan,
                          Colors.blue,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
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
    );
  }
}
