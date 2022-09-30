import 'package:get/get.dart';
import 'package:instargram_clone/src/controller/auth_controller.dart';
import 'package:instargram_clone/src/controller/bottom_nav_controller.dart';
import 'package:instargram_clone/src/controller/mypage_controller.dart';
import 'package:instargram_clone/src/controller/upload_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }

  static addtionalBinding() {
    Get.put(MypageController(), permanent: true);
    Get.put(UploadController(), permanent: true);
  }
}
