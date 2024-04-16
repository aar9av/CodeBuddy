// ignore_for_file: curly_braces_in_flow_control_structures, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Functions {

  static getRoomsJoined() {
    return Data.roomData.length;
  }

  static getRoomsCreated() {
    int res = 0;
    for(int i=0; i<Data.roomData.length; ++i) {
      if(Data.roomData[i][0] == Data.username) {
        res++;
      }
    }
    return res;
  }

  static void createRoom(String roomName, String roomTech, List<String> roomMembers, String roomDescription) {
    Data.roomData.add([
      Data.username,
      roomName,
      roomTech,
      roomDescription,
      '0 min',
      roomMembers,
      [],
    ]);
  }

  static List<int> getCreatedRoomData() {
    List<int> roomCreated = [];
    for(int i=0; i<Data.roomData.length; ++i) {
      if(Data.roomData[i][0] == Data.username) {
        roomCreated.add(i);
      }
    }
    return roomCreated;
  }

  static String get_badge(int platformIndex, int rating) {
    if(rating == 0) {
      return '';
    }
    if(platformIndex == 0) {
      if(rating >= 1850 && rating < 2150) {
        return 'Knight';
      }
      if(rating >= 2150) {
        return 'Guardian';
      }
    }
    if(platformIndex == 1) {
      int stars = 0;
      if(rating < 1400)
        stars = 1;
      else if(rating < 1600)
        stars = 2;
      else if(rating < 1800)
        stars = 3;
      else if(rating < 2000)
        stars = 4;
      else if(rating < 2200)
        stars = 5;
      else if(rating < 2500)
        stars = 6;
      else
        stars = 7;
      String res = "";
      for(int i=0; i<stars; ++i) {
        res += '\u2605';
      }
      return res;
    }
    if(platformIndex == 2) {
      if(rating < 1200) {
        return 'Newbie';
      }
      if(rating < 1400) {
        return 'Pupil';
      }
      if(rating < 1600) {
        return 'Specialist';
      }
      if(rating < 1900) {
        return 'Expert';
      }
      if(rating < 2100) {
        return 'Candidate Master';
      }
      if(rating < 2300) {
        return 'Master';
      }
      if(rating < 2400) {
        return 'International Master';
      }
      if(rating < 2600) {
        return 'Grandmaster';
      }
      if(rating < 3000) {
        return 'International Grandmaster';
      }
      return 'Lagendary Grandmaster';
    }
    return '';
  }

  static Color getBadgeColor(String badge) {
    if(badge == '') {
      return Colors.transparent;
    }
    if(badge == 'Knight') {
      return Colors.green.shade900;
    }
    if(badge == 'Guardian') {
      return Colors.blueAccent;
    }
    if(badge[0] == '\u2605') {
      if(badge.length == 1) {
        return Colors.black45;
      }
      if(badge.length == 2) {
        return Colors.green.shade800;
      }
      if(badge.length == 3) {
        return Colors.blueAccent;
      }
      if(badge.length == 4) {
        return Colors.purple.shade800;
      }
      if(badge.length == 5) {
        return Colors.yellow.shade700;
      }
      if(badge.length == 6) {
        return Colors.orange.shade800;
      }
      if(badge.length == 7) {
        return Colors.red.shade900;
      }
    }
    if(badge == 'Newbie') {
      return Colors.black45;
    }
    if(badge == 'Pupil') {
      return Colors.green.shade900;
    }
    if(badge == 'Specialist') {
      return Colors.cyanAccent.shade700;
    }
    if(badge == 'Expert') {
      return Colors.blueAccent;
    }
    if(badge == 'Candidate Master') {
      return Colors.purple.shade800;
    }
    if(badge == 'Master') {
      return Colors.yellow.shade900;
    }
    if(badge == 'International Master') {
      return Colors.yellow.shade900;
    }
    if(badge == 'Grandmaster') {
      return Colors.red.shade900;
    }
    if(badge == 'International Grandmaster') {
      return Colors.red.shade900;
    }
    if(badge == 'Lagendary Grandmaster') {
      return Colors.red.shade900;
    }
    return Colors.transparent;
  }

  static Future<int> auth(String username, String pswd) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/$username/authenticate';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': pswd,
        }),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        Data.currentUser = jsonData['user'];
        updateUserData();
        getUserSubmissions(username);
        return 0;
      } else if (response.statusCode == 404) {
        return 1;
      } else if (response.statusCode == 400) {
        return 2;
      } else {
        return 3;
      }
    } catch (e) {
      print(e);
      return 3;
    }
  }

  static Future<bool> createUser(String fullName, String email, String username, String password, String leetcode_id, String codechef_id, String codeforces_id, String bio) async {
    List<String> names = fullName.split(" ");
    String firstName = names.isNotEmpty ? names.first : '';
    String lastName = names.length > 1 ? names.sublist(1).join(" ") : '';
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/create/$username';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "email": email,
          "password": password,
          "first_name": firstName.trim(),
          "last_name": lastName.trim(),
          "bio": bio,
          "codechef_id": codechef_id,
          "codeforces_id": codeforces_id,
          "leetcode_id": leetcode_id
        }),
      );

      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        Data.currentUser = jsonData;
        updateUserData();
        getUserSubmissions(username);
        return true;
      } else {
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<int> findUser(String username, String email) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/users';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        Data.allUsers = jsonDecode(response.body) as List<dynamic>;
        for (var user in Data.allUsers) {
          if (user['email'] == email) {
            print(user['username']);
            print(email);
            return 1;
          }
          if(user['username'] == username) {
            return 2;
          }
        }
        return 0;
      } else {
        return 3;
      }
    } catch (e) {
      return 3;
    }
  }

  static Future<bool> updateUser(String username, String email, String fullName, String leetcode, String codechef, String codeforces, String bio, bool? isPswd, String password) async {
    List<String> names = fullName.split(" ");
    String firstName = names.isNotEmpty ? names.first : '';
    String lastName = names.length > 1 ? names.sublist(1).join(" ") : '';
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/$username/update';

    try {
      final Map<String, dynamic> requestBody = {
        "email": email,
        "first_name": firstName.trim(),
        "last_name": lastName.trim(),
        "bio": bio,
        "codechef_id": codechef,
        "codeforces_id": codeforces,
        "leetcode_id": leetcode,
      };
      if (isPswd == true) {
        requestBody['password'] = password;
      }

      final response = await http.patch(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        Data.currentUser = jsonData;
        updateUserData();
        return true;
      } else {
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static void updateUserData() {
      Data.username = Data.currentUser?['username'] ?? '';
      Data.name = (Data.currentUser?['first_name'] ?? '') + ' ' +
          (Data.currentUser?['last_name'] ?? '');
      Data.email = Data.currentUser?['email'] ?? '';
      Data.leetcodeUsername = Data.currentUser?['leetcode_id'] ?? '';
      Data.codechefUsername = Data.currentUser?['codechef_id'] ?? '';
      Data.codeforcesUsername = Data.currentUser?['codeforces_id'] ?? '';
      Data.bio = Data.currentUser?['bio'] ?? '';
      Data.roomsJoined = Functions.getRoomsJoined().toString();
      Data.roomsCreated = Functions.getRoomsCreated().toString();
      Data.platformData = [
        [
          'Leetcode',
          Data.leetcodeUsername,
          (Data.currentUser?['leetcode_rating'] ?? '').toString(),
          (Data.currentUser?['number_of_leetcode_contests'] ?? '0').toString(),
          Functions.get_badge(0, Data.currentUser?['leetcode_rating'] ?? 0),
          (Data.currentUser?['number_of_leetcode_questions'] ?? '0').toString(),
          (Data.currentUser?['global_rank_leetcode'] ?? '').toString() == '-1' ? '' : (Data.currentUser?['global_rank_leetcode'] ?? '').toString(),
        ],
        [
          'Codechef',
          Data.codechefUsername,
          (Data.currentUser?['codechef_rating'] ?? '').toString(),
          (Data.currentUser?['number_of_codechef_contests'] ?? '0').toString(),
          Functions.get_badge(1, Data.currentUser?['codechef_rating'] ?? 0),
          (Data.currentUser?['number_of_codechef_questions'] ?? '0').toString(),
          (Data.currentUser?['global_rank_codechef'] ?? '').toString() == '-1' ? '' : (Data.currentUser?['global_rank_codechef'] ?? '').toString(),
        ],
        [
          'Codeforces',
          Data.codeforcesUsername,
          (Data.currentUser?['codeforces_rating'] ?? '').toString(),
          (Data.currentUser?['number_of_codeforces_contests'] ?? '0').toString(),
          Functions.get_badge(2, Data.currentUser?['codeforces_rating'] ?? 0),
          (Data.currentUser?['number_of_codeforces_questions'] ?? '0').toString(),
          '',
        ],
      ];
      getUserSubmissions(Data.username);
  }

  static Future<void> getUserSubmissions(String username) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/$username/problems';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        List<dynamic> submissions = jsonDecode(response.body) as List<dynamic>;
        Data.submissions = [[],[],[]];
        for(int i=0; i<submissions.length; ++i) {
          if(submissions[i]['platform'] == 'LeetCode') {
            Data.submissions[0].add(submissions[i]);
          } else if(submissions[i]['platform'] == 'Codechef') {
            Data.submissions[1].add(submissions[i]);
          } else if(submissions[i]['platform'] == 'Codeforces') {
            Data.submissions[2].add(submissions[i]);
          }
        }
      } else {
        print('Error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}