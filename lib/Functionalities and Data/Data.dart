import 'package:flutter/material.dart';



class Data {

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

  static List<dynamic> allUsers = [];

  static Map<String, dynamic>? currentUser;

  static String username = currentUser?['username'] ?? '';
  static String name = (currentUser?['first_name'] ?? '') + ' ' + (currentUser?['last_name'] ?? '');
  static String email = currentUser?['email'] ?? '';
  static String leetcodeUsername = currentUser?['leetcode_id'] ?? '';
  static String codechefUsername = currentUser?['codechef_id'] ?? '';
  static String codeforcesUsername = currentUser?['codeforces_id'] ?? '';
  static String bio = currentUser?['bio'] ?? '';
  static int roomCreated = 0;

  static List<String> platformIcon = [
    'Assets/Home.png',
    'Assets/Leetcode.png',
    'Assets/Codechef.png',
    'Assets/CodeForces.png'
  ];

  static List<dynamic> platformData = [['Leetcode', '', '', 0, '', 0, ''], ['Codechef', '', '', 0, '', 0, ''], ['Codeforces', '', '', 0, '', 0, '']];

  static int platformPageIndex = 0;

  static List<dynamic>submissions = [[],[],[]];

  static List<dynamic>contests = [[],[],[]];

  static List<dynamic> searchResult = [];

  static Map<String, dynamic>? searchedUser;

  static List<List> searchedUserPlatformData = [['', 0, ''], ['', 0, ''], ['', 0, '']];

  static List<dynamic> allRooms = [];

  static List<dynamic> userRooms = [];

  static List<dynamic> roomChats = [];

  static dynamic searchedRoom;

  static List<dynamic> searchedRoomChats = [];
}