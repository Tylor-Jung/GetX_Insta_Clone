import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instargram_clone/src/controller/auth_controller.dart';
import 'package:instargram_clone/src/model/instargram_user.dart';

class MypageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx<IUser?> targetUser = IUser().obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    _loadData(); // mypage에서 다른 사람의 계정으로 넘어가도 화면을 재사용하기 위해
  }

  void setTargetUser() {
    var uid = Get.parameters['targetUid'];
    if (uid == null) {
      targetUser(AuthController.to.user.value);
    }else{
      // TODO 상대 uid를 바탕으로  users collection을 조회
    }
  }

  void _loadData() {
    setTargetUser();

    // 포스트 리스트 로드
    // 사용자 정보 로드
  }
}
