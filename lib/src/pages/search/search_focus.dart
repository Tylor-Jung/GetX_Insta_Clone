import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instargram_clone/src/components/image_data.dart';
import 'package:instargram_clone/src/controller/bottom_nav_controller.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({super.key});

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tapController;

  @override
  void initState() {
    super.initState();
    tapController = TabController(length: 5, vsync: this);
  }

  Widget _tapMenuOne(String menu) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '인기',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: tapController,
      children: const [
        Center(child: Text('인기 페이지')),
        Center(child: Text('계정 페이지')),
        Center(child: Text('오디오 페이지')),
        Center(child: Text('태그 페이지')),
        Center(child: Text('장소 페이지')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: BottomNavController.to.willPopAction,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(IconsPath.backBtnIcon),
            )),
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '검색',
                contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
                isDense: true),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: AppBar().preferredSize.height,
              width: Size.infinite.width,
              child: TabBar(
                controller: tapController,
                tabs: [
                  _tapMenuOne('인기'),
                  _tapMenuOne('계정'),
                  _tapMenuOne('오디오'),
                  _tapMenuOne('태그'),
                  _tapMenuOne('장소'),
                ],
              ),
            )),
      ),
      body: _body(),
    );
  }
}
