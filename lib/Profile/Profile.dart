
import 'package:flutter/material.dart';
import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import '../Start/Dashboard.dart';
import '../Start/HomePage.dart';
import 'EditProfile1.dart';

class Profile extends StatefulWidget {
   const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Assets/Profile.png',
                      height: 100,
                    ),
                    Text(
                      Data.name,
                      style: TextStyle(
                        color: Data.themeColors[0],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Data.username,
                      style: TextStyle(
                        color: Data.themeColors[5],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Data.platformPageIndex = 1;
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DashBoard(),),
                      );
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'Assets/Leetcode.png',
                            height: 40,
                          ),
                          Text(
                            Data.leetcodeUsername,
                            style: TextStyle(
                              fontSize: 12,
                              color: Data.themeColors[5],
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Data.platformPageIndex = 2;
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const DashBoard(),),
                      );
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 0.2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'Assets/Codechef.png',
                            height: 40,
                          ),
                          Text(
                            Data.codechefUsername,
                            style: TextStyle(
                              fontSize: 12,
                              color: Data.themeColors[5],
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Data.platformPageIndex = 3;
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const DashBoard(),),
                      );
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:  const Color(0xFF1F1F1F),
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Data.themeColors[5],
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'Assets/CodeForces.png',
                            height: 40,
                          ),
                          Text(
                            Data.codeforcesUsername,
                            style: TextStyle(
                              fontSize: 12,
                              color: Data.themeColors[5],
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:  const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Data.themeColors[5],
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                      color: Data.themeColors[5],
                    ),
                    Text(
                      Data.bio,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Data.themeColors[5],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 240,
                padding:  const EdgeInsets.all(20),
                decoration:  const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Data.platformPageIndex = 0;
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DashBoard(),),
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width/3 - 25,
                              padding:  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Data.themeColors[0],
                                      Data.themeColors[0].withAlpha(100),
                                    ]
                                ),
                                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                              ),
                              child:  const Icon(
                                Icons.home,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/3 - 30,
                              padding:  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:  const Color(0xFF1F1F1F),
                                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Data.themeColors[5],
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    Data.userRooms.length.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Data.themeColors[5],
                                    ),
                                  ),
                                  Text(
                                    'Rooms\nJoined',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Data.themeColors[5],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width/3 - 30,
                              padding:  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:  const Color(0xFF1F1F1F),
                                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Data.themeColors[5],
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    Data.roomCreated.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Data.themeColors[5],
                                    ),
                                  ),
                                  Text(
                                    'Rooms\nCreated',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Data.themeColors[5],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Data.themeColors[0],
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Data.currentUser = null;
                          Data.platformPageIndex = 0;
                          Functions.updateUserData();
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>  const HomePage())
                          );
                        },
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(
                            fontSize: 16,
                            color: Data.themeColors[0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const EditProfile1())
          );
        },
        elevation: 5,
        backgroundColor: Data.themeColors[0],
        child: Icon(
          Icons.edit,
          color: Data.themeColors[7],
          size: 30,
        ),
      ),
    );
  }
}
