import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instargram_clone/src/model/instargram_user.dart';

// 유저 정보를 'users' collection 에서 받아와서 'uid'가 같을 때 정보를 취한다.

class UserRepository {
  static Future<IUser?> loginUserByUid(String uid) async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return IUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(IUser user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
