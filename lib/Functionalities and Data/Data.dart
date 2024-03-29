import 'package:code_buddy/Functionalities%20and%20Data/Functions.dart';
import 'package:flutter/material.dart';


class Data {

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

  static int platformPageIndex = 0;

  // Current User Info
  static String username = "@aar9av";
  static String name = "Arnav Gupta";
  static String email = "aar9av@gmail.com";
  static String leetcodeUsername = "@leetcode";
  static String codechefUsername = "@codechef";
  static String codeforcesUsername = "@codeforces";
  static String bio = "Ram Ram Bhai Sarayane,\nAaj hai hamara project banane ka doosra din,\nAur ham abhi kam kr rhe hai figma design pr...";
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
      '@aar9av', 'C++', 'DSA', 'Bs DSA karna hai.', '4 hours ago', ['@aar9av', '@prince', '@shivam', '@neeraj', '@shantanu'],
      [["HI", "@aar9av"], ["Hello", "@shivam"], ["3 Sum kiya h kisi ne.", "@prince"], ["Mughe samagh hi nhi aaya", "@aar9av"],]
    ],
    [
      '@prince', 'MERN', 'Web Development', 'Project bhi jaroori hai.', '1 months ago', ['@aar9av', '@prince', '@shivam', '@shantanu', '@neeraj', '@prashant'],
      [["HI", "@aar9av"], ["Hi", "@shivam"], ["Hi everyone", "@prince"], ["Java Script aati h", "@aar9av"],]
    ],
  ];

  // Platform Data
  // Name, username, globalRank, contests, rating, questions
  static List<dynamic> platformData = [
    ['Leetcode', leetcodeUsername, '128896', '19', '1762', '423'],
    ['Codechef', codechefUsername, '5097', '4', '1799', '15'],
    ['Codeforces', codeforcesUsername, 'Newbie', '2', '765', '6'],
  ];
  static List<dynamic> submissions = [
    [
      ["N Queen", "2 Days ago"],
      ["Rat in a Maze", "2 Days ago"],
      ["Sudoku Solver", "2 Days ago"],
      ["Tower of Hanoi", "2 Days ago"],
      ["Word Break", "2 Days ago"],
      ["Sort Stack", "2 Days ago"],
      ["Palindrome Partitioning", "2 Days ago"],
      ["Number of Islands", "2 Days ago"],
      ["Flood Fill", "2 Days ago"],
      ["Word Search", "2 Days ago"],
    ],
    [
      ["N Queen", "2 Days ago"],
      ["Rat in a Maze", "2 Days ago"],
      ["Sudoku Solver", "2 Days ago"],
      ["Tower of Hanoi", "2 Days ago"],
      ["Word Break", "2 Days ago"],
      ["Sort Stack", "2 Days ago"],
      ["Palindrome Partitioning", "2 Days ago"],
      ["Number of Islands", "2 Days ago"],
    ],
    [
      ["Flood Fill", "2 Days ago"],
      ["Word Search", "2 Days ago"],
      ["N Queen", "2 Days ago"],
      ["Rat in a Maze", "2 Days ago"],
      ["Sudoku Solver", "2 Days ago"],
      ["Tower of Hanoi", "2 Days ago"],
      ["Word Break", "2 Days ago"],
      ["Sort Stack", "2 Days ago"],
      ["Palindrome Partitioning", "2 Days ago"],
      ["Number of Islands", "2 Days ago"],
      ["Flood Fill", "2 Days ago"],
      ["Word Search", "2 Days ago"],
    ],
  ];
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