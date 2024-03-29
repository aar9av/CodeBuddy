import 'Data.dart';

class Functions {

  static void updateProfile(String name, String username, String bio, String leetcode, String codechef, String codeforces) {
    Data.name = name;
    Data.username = username;
    Data.bio = bio;
    Data.leetcodeUsername = leetcode;
    Data.codechefUsername = codechef;
    Data.codeforcesUsername = codeforces;
  }

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

}