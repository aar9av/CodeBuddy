import 'package:flutter/material.dart';

import '../Functionalities and Data/Data.dart';
import '../Functionalities and Data/Functions.dart';
import '../Start/Dashboard.dart';

class CreateRoom extends StatefulWidget {
   const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  TextEditingController roomName = TextEditingController();
  TextEditingController roomTech = TextEditingController();
  TextEditingController roomDescription = TextEditingController();
  TextEditingController roomMember = TextEditingController();
  List<String> roomMembers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin:  const EdgeInsets.all(15),
            padding:  const EdgeInsets.all(5),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text(
                  'Create New Room',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 550,
                  padding:  const EdgeInsets.all(10),
                  decoration:  const BoxDecoration(
                    color: Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       const SizedBox(height: 15),
                      Container(
                        height: 40,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: roomName,
                          decoration: InputDecoration(
                            hintText: 'Enter Room Name',
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
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
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: roomTech,
                          decoration: InputDecoration(
                            hintText: 'Enter Tech Stack of Room',
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
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
                        height: 90,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          controller: roomDescription,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Enter Description of Room',
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2 + 20,
                            color: Colors.black,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: roomMember, // Use roomMember controller for input field
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Data.themeColors[0],
                                ),
                                hintText: 'Search User to Add.',
                                hintStyle: TextStyle(
                                  color: Data.themeColors[0],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Data.themeColors[0],),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Data.themeColors[0],),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              ),
                              style: TextStyle(
                                color: Data.themeColors[0],
                                fontSize: 18,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                roomMembers.add(roomMember.text);
                              });
                              roomMember.clear();
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2 - 90,
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
                                  'ADD',
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
                      Container(
                        height: 90,
                        color: Colors.black,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          readOnly: true,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: roomMembers.join(', '), // Display room members here
                            hintStyle: TextStyle(
                              color: Data.themeColors[0],
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Data.themeColors[0],),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          ),
                          style: TextStyle(
                            color: Data.themeColors[0],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                              Functions.createRoom(roomName.text, roomTech.text, roomMembers, roomDescription.text);
                              Navigator.pop(context);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashBoard(),));
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
                              child: const Center(
                                child: Text(
                                  'CREATE',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
