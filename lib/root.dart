import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instargram_clone/src/app.dart';
import 'package:instargram_clone/src/controller/auth_controller.dart';
import 'package:instargram_clone/src/model/instargram_user.dart';
import 'package:instargram_clone/src/pages/login.dart';
import 'package:instargram_clone/src/pages/signup_page.dart';

class Root extends GetView<AuthController> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            //todo: 내부 firlebase 유저 정보 조회 (user.data!.uid)
            return FutureBuilder<IUser?>(
                future: controller.loginUser(user.data!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const App();
                  } else {
                    return Obx(() => controller.user.value.uid != null
                        ? const App()
                        : SignupPage(uid: user.data!.uid));
                  }
                });
          } else {
            return const Login();
          }
        });
  }
}
