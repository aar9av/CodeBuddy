// ignore_for_file: curly_braces_in_flow_control_structures, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Functions {

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

  static Future<bool> createUser(String fullName, String email, String username, String password, String leetcode_id, String codechef_id, String codeforces_id, String bio) async {
    List<String> names = fullName.split(" ");
    String firstName = names.isNotEmpty ? names.first : '';
    String lastName = names.length > 1 ? names.sublist(1).join(" ") : '';
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/$username/create';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
          "email": email,
          "password": password,
          "first_name": firstName.trim(),
          "last_name": lastName.trim(),
          "bio": bio,
          "leetcode": {
            "id": leetcode_id == '' ? null : leetcode_id,
          },
          "codechef": {
            "id": codechef_id == '' ? null : codechef_id,
          },
          "codeforces": {
            "id": codeforces_id == '' ? null : codeforces_id,
          },
        }),
      );
      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        Data.currentUser = jsonData;
        await updateUserData();
        await getUserSubmissions(username);
        await getUserContests(username);
        await getRooms(username);
        return true;
      } else {
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
    Data.searchedUser?.clear();
    Data.searchedUserPlatformData = [[],[],[]];

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        Data.allUsers = jsonDecode(response.body) as List<dynamic>;
        for (var user in Data.allUsers) {
          if (user['email'] == email) {
            return 1;
          }
          if(user['username'] == username) {
            Data.searchedUser = user;
            updateSelectedUserPlatformData();
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
        await updateUserData();
        await getUserSubmissions(username);
        await getUserContests(username);
        await getRooms(username);
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
        "leetcode": {
          "id": leetcode == '' ? null : leetcode,
        },
        "codechef": {
          "id": codechef == '' ? null : codechef,
        },
        "codeforces": {
          "id": codeforces == '' ? null : codeforces,
        },
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
      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        Data.currentUser = jsonData;
        await updateUserData();
        await getUserSubmissions(username);
        await getUserContests(username);
        await getRooms(username);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<void> updateUserData() async {
      Data.username = Data.currentUser?['username'] ?? '';
      Data.name = (Data.currentUser?['first_name'] ?? '') + ' ' + (Data.currentUser?['last_name'] ?? '');
      Data.email = Data.currentUser?['email'] ?? '';
      Data.leetcodeUsername = Data.currentUser?['leetcode']['id'] ?? '';
      Data.codechefUsername = Data.currentUser?['codechef']['id'] ?? '';
      Data.codeforcesUsername = Data.currentUser?['codeforces']['id'] ?? '';
      Data.bio = Data.currentUser?['bio'] ?? '';
      Data.platformData = [
        [
          'Leetcode',
          Data.leetcodeUsername,
          (Data.currentUser?['leetcode']['rating'] ?? '').toString(),
          (Data.currentUser?['leetcode']['number_of_contests'] ?? '0').toString(),
          Functions.get_badge(0, Data.currentUser?['leetcode']['rating'] ?? 0),
          (Data.currentUser?['leetcode']['number_of_questions'] ?? '0').toString(),
          (Data.currentUser?['leetcode']['global_rank'] ?? '').toString() == '-1' ? '' : (Data.currentUser?['leetcode']['global_rank'] ?? '').toString(),
        ],
        [
          'Codechef',
          Data.codechefUsername,
          (Data.currentUser?['codechef']['rating'] ?? '').toString(),
          (Data.currentUser?['codechef']['number_of_contests'] ?? '0').toString(),
          Functions.get_badge(1, Data.currentUser?['codechef']['rating'] ?? 0),
          (Data.currentUser?['codechef']['number_of_questions'] ?? '0').toString(),
          (Data.currentUser?['codechef']['global_rank'] ?? '').toString() == '-1' ? '' : (Data.currentUser?['codechef']['global_rank'] ?? '').toString(),
        ],
        [
          'Codeforces',
          Data.codeforcesUsername,
          (Data.currentUser?['codeforces']['rating'] ?? '').toString(),
          (Data.currentUser?['codeforces']['number_of_contests'] ?? '0').toString(),
          Functions.get_badge(2, Data.currentUser?['codeforces']['rating'] ?? 0),
          (Data.currentUser?['codeforces']['number_of_questions'] ?? '0').toString(),
          '',
        ],
      ];
      getUserSubmissions(Data.username);
      getUserContests(Data.username);
      findUser('####', '####');
  }

  static Future<void> getUserSubmissions(String username) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/$username/submissions';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        List<dynamic> submissions = jsonDecode(response.body) as List<dynamic>;
        Data.submissions = [[],[],[]];
        for(int i=0; i<submissions.length; ++i) {
          if(submissions[i]['submission_link'].substring(8,16) == 'leetcode') {
            Data.submissions[0].add(submissions[i]);
          } else if(submissions[i]['submission_link'].substring(12,20) == 'codechef') {
            Data.submissions[1].add(submissions[i]);
          } else if(submissions[i]['submission_link'].substring(8,18) == 'codeforces') {
            Data.submissions[2].add(submissions[i]);
          }
        }
        for (var subList in Data.submissions) {
          subList.sort((a, b) => DateTime.parse(b['submitted_at']).compareTo(DateTime.parse(a['submitted_at'])));
        }
      } else {
        print('Error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> getUserContests(String username) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/user/$username/get-rating-changes';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        List<dynamic> contests = jsonDecode(response.body) as List<dynamic>;
        Data.contests = [[],[],[]];
        for(int i=0; i<contests.length; ++i) {
          if (contests[i]['contest']['platform'] == 'Leetcode') {
            Data.contests[0].add(contests[i]);
          }
          if (contests[i]['contest']['platform'] == 'Codechef') {
            Data.contests[1].add(contests[i]);
          }
          if (contests[i]['contest']['platform'] == 'Codeforces') {
            Data.contests[2].add(contests[i]);
          }
        }
        for (var subList in Data.contests) {
          subList.sort((a, b) => DateTime.parse(b['contest']['start_time']).compareTo(DateTime.parse(a['contest']['start_time'])));
        }
      } else {
        print('Error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static void updateSelectedUserPlatformData() {
    int roomsJoined = 0, roomsCreated = 0;
    for(int i=0; i<Data.allRooms.length; ++i) {
      for(int j=0; j<Data.allRooms[i]['participants'].length; ++j) {
        if(Data.allRooms[i]['participants'][j] == Data.searchedUser?['username']) {
          roomsJoined++;
        }
      }
      if(Data.allRooms[i]['host'] == Data.searchedUser?['username']) {
        roomsCreated++;
      }
    }
    Data.searchedUser?['rooms_joined'] = roomsJoined;
    Data.searchedUser?['rooms_created'] = roomsCreated;
    Data.searchedUserPlatformData = [
      [
        (Data.searchedUser?['leetcode']['id'] ?? '').toString(),
        Data.searchedUser?['leetcode']['number_of_questions'] ?? 0,
        Functions.get_badge(0, Data.searchedUser?['leetcode']['rating'] ?? 0),
      ],
      [
        (Data.searchedUser?['codechef']['id'] ?? '').toString(),
        Data.searchedUser?['codechef']['number_of_questions'] ?? 0,
        Functions.get_badge(1, Data.searchedUser?['codechef']['rating'] ?? 0),
      ],
      [
        (Data.searchedUser?['codeforces']['id'] ?? '').toString(),
        Data.searchedUser?['codeforces']['number_of_questions'] ?? 0,
        Functions.get_badge(2, Data.searchedUser?['codeforces']['rating'] ?? 0),
      ]
    ];
  }

  static Future<void> getRooms(String username) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/rooms';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        Data.allRooms = jsonDecode(response.body) as List<dynamic>;
        Data.userRooms = [];
        Data.roomCreated = 0;
        for(int i=0; i<Data.allRooms.length; ++i) {
          for(int j=0; j<Data.allRooms[i]['participants'].length; ++j) {
            if(Data.allRooms[i]['participants'][j] == username) {
              Data.userRooms.add(Data.allRooms[i]);
            }
          }
          if(Data.allRooms[i]['host'] == username) {
            Data.roomCreated++;
          }
        }
        for (var subList in Data.userRooms) {
          subList.sort((a, b) => DateTime.parse(b['updated']).compareTo(DateTime.parse(a['updated'])));
        }
      } else {
        print('Error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static getRoomChat(roomID, isSearched) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/room/$roomID/messages';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      });
      if (response.statusCode == 200) {
        List<dynamic> roomChat = jsonDecode(response.body) as List<dynamic>;
        isSearched ? Data.searchedRoomChats = roomChat : Data.roomChats = roomChat;
        for (var subList in Data.roomChats) {
          subList.sort((a, b) => DateTime.parse(b['updated']).compareTo(DateTime.parse(a['updated'])));
        }
      } else {
        print('Error');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static addMessage(String message, String roomID) async {
    String? authToken = dotenv.env['TOKEN'];
    String? url = dotenv.env['URL'];
    String apiUrl = '$url/room/$roomID/send-message';

    try {
      final Map<String, dynamic> requestBody = {
        'sender': Data.username,
        'message': message
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        await Functions.getRoomChat(roomID, true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}