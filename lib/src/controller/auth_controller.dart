import 'package:get/get.dart';
import 'package:instargram_clone/src/model/instargram_user.dart';
import 'package:instargram_clone/src/repository/user_repository.dart';

class AuthController extends GetxController {
  Future<IUser?> loginUser(String uid) async {
    //DB조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }
}
