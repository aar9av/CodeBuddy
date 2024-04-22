import 'package:flutter/material.dart';

import 'Functions.dart';


class Data {

  static List<dynamic> allRooms = [];

  static List<dynamic> userRooms = [];

  static List<dynamic> createdRooms = [];

  static int platformPageIndex = 0;

  static List<dynamic>submissions = [[],[],[]];

  static List<dynamic>contests = [[],[],[]];

  // API Testing
  static Map<String, dynamic>? currentUser;

  static Map<String, dynamic>? searchedUser;

  static List<dynamic> allUsers = [];

  static List<dynamic> searchResult = [];

  // Theme Colors
  static List<Color> themeColors = [
    const Color(0xFF9DB2BF),    // 0
    const Color(0xFFE7A41F),    // 1
    const Color(0xFFEDC7B7),    // 2
    const Color(0xFF2196F3),    // 3
    const Color(0xFFFFFFFF),    // 4
    const Color(0xFF818181),    // 5
    const Color(0xFF1F1F1F),    // 6
    const Color(0xFF000000),    // 7
    Colors.cyan,                // 8
    Colors.yellow               // 9
  ];

  // Nav Bar Images
  static List<String> platformIcon = [
    'Assets/Home.png',
    'Assets/Leetcode.png',
    'Assets/Codechef.png',
    'Assets/CodeForces.png'
  ];

  // Current User Info
  static String username = currentUser?['username'] ?? '';
  static String name = (currentUser?['first_name'] ?? '') + ' ' + (currentUser?['last_name'] ?? '');
  static String email = currentUser?['email'] ?? '';
  static String leetcodeUsername = currentUser?['leetcode_id'] ?? '';
  static String codechefUsername = currentUser?['codechef_id'] ?? '';
  static String codeforcesUsername = currentUser?['codeforces_id'] ?? '';
  static String bio = currentUser?['bio'] ?? '';
  static String roomsJoined = Functions.getRoomsJoined().toString();
  static String roomsCreated = Functions.getRoomsCreated().toString();

  // Room Data
  // Owner, Name, Tech, Description, Last Msg, Members[], Chat[]
  static List<dynamic> roomData = [
    [
      '@aar9av', 'Flutter', 'Android Development', 'Bahut hi badhia room h.', '4 days ago', ['@aar9av', '@prince', '@shivam', '@shantanu', ],
      [["HI", "@aar9av"], ["Hello", "@shivam"], ["Aur bhai kya haal chaal.", "@prince"], ["Mai badhia tum log batao", "@aar9av"],]
    ],
    [
      '@shivam', 'MongoDB', 'DataBase', 'DataBase ke liye room', '2 months ago', ['@aar9av', '@prince', '@shivam',],
      [["HI", "@aar9av"], ["Hello", "@shivam"], ["Kaha se ho?", "@prince"], ["NIT Bhopal", "@aar9av"],]
    ],
    [
      '@aar9av', 'C++', 'DSA', 'Bs DSA karna hai.\nBs DSA karna hai.\nBs DSA karna hai.\nBs DSA karna hai.\nBs DSA karna hai.\nBs DSA karna hai.\nBs DSA karna hai.\n', '4 hours ago', ['@aar9av', '@prince', '@shivam', '@neeraj', '@shantanu', '@aar9av', '@prince', '@shivam', '@neeraj', '@shantanu', '@aar9av', '@prince', '@shivam', '@neeraj', '@shantanu', '@aar9av', '@prince', '@shivam', '@neeraj', '@shantanu'],
      [["HI", "@aar9av"], ["Hello", "@shivam"], ["3 Sum kiya h kisi ne.", "@prince"], ["Mughe samagh hi nhi aaya", "@aar9av"],]
    ],
    [
      '@prince', 'MERN', 'Web Development', 'Project bhi jaroori hai.', '1 months ago', ['@aar9av', '@prince', '@shivam', '@shantanu', '@neeraj', '@prashant'],
      [["HI", "@aar9av"], ["Hi", "@shivam"], ["Hi everyone", "@prince"], ["Java Script aati h", "@aar9av"],]
    ],
  ];

  // Platform Data
  static List<dynamic> platformData = [['Leetcode', '', '', 0, '', 0, ''], ['Codechef', '', '', 0, '', 0, ''], ['Codeforces', '', '', 0, '', 0, '']];

  static List<List> searchedUserPlatformData = [['', 0, ''], ['', 0, ''], ['', 0, '']];

  static List<dynamic> roomChats = [];
}