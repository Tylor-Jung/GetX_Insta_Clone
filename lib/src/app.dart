import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instargram_clone/src/components/image_data.dart';
import 'package:instargram_clone/src/controller/bottom_nav_controller.dart';
import 'package:instargram_clone/src/pages/active_history.dart';
import 'package:instargram_clone/src/pages/home.dart';
import 'package:instargram_clone/src/pages/search.dart';

// getx controller 셋팅방법
// 1, controller 파일, controller class 생성
// 2, Rx 형식으로 변수 생성
// 3, GetView<파일명> 으로 state 관리
// 3, controller.xxx.value 인스턴스를 통해 값 변경

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              Navigator(
                key: controller
                    .searchPageNavigationkey, //NestedRoute를 하기위한 Material 접근방법 ,, 순서 및 방법 암기
                onGenerateRoute: (RouteSettings) {
                  return MaterialPageRoute(
                      builder: (context) => const Search());
                },
              ),
              Container(), //upload페이지는 따로 레이아웃이 추가되는 형식이라서 빈 container만 두고 내용들이 밀리지 않도록 한다.
              const ActiveHistory(),
              Container(child: Center(child: Text('ACTIVITY'))),
              Container(child: Center(child: Text('MYPAGE'))),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
