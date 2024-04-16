import 'package:flutter/material.dart';

import 'Functions.dart';


class Data {

  static int platformPageIndex = 0;

  static List<dynamic>submissions = [[],[],[]];

  // API Testing
  static Map<String, dynamic>? currentUser;

  static List<dynamic> allUsers = [];

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

  // Search Bar Text
  static List<String> searchBarText = [
    'Search Room',              // 0
    'Search Leetcode User',     // 1
    'Search Codechef User',     // 2
    'Search Codeforces User',   // 3
    'Serach Submission',        // 4
    'Search Contest',           // 5
    'Search User',              // 6
    'Search Room Member',       // 7
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
  static List<dynamic> platformData = [[], [], []];

  static List<dynamic> contests = [
    [
      ["Weekly Contest 389", "5139", "17, March 2024", "+(13)", "3", "4"],
      ["Biweekly Contest 126", "2185", "16, March 2024", "+(42)", "3", "4"],
      ["Weekly Contest 388", "6101", "10, March 2024", "+(12)", "3", "4"],
    ],
    [
      ["Starters 126 (Div 2)", "1175", "20, March 2024", "-(44)", "2", "7"],
      ["Starters 125 (Div 2)", "243", "13, March 2024", "+(129)", "4", "7"],
      ["Starters 124 (Div 2)", "795", "6, March 2024", "+(35)", "4", "7"],
    ],
    [
      ["Round 935 (Div 3)", "3757", "19, March 2024", "+(328)", "3", "8"],
      ["Round 933 (Div 3)", "11083", "11, March 2024", "+(437)", "3", "7"],
    ]
  ];
}