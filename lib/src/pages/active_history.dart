import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instargram_clone/src/app.dart';
import 'package:instargram_clone/src/components/avatar_widget.dart';
import 'package:instargram_clone/src/components/image_data.dart';
import 'package:instargram_clone/src/controller/bottom_nav_controller.dart';
import 'package:instargram_clone/src/pages/home.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({super.key});

  Widget _activeItemOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          AvatarWidget(
              type: AvatarType.TYPE2,
              size: 40,
              thumbPath:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7vojc0_0uNUmdWuhnjuvbxaXyMZxT5BckBQ&usqp=CAU'),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '아이유님',
                style: TextStyle(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '이 회원님의 게시물을 좋아합니다.',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: ' 5일전',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newRecentlyActiveView(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            date,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: BottomNavController.to.willPopAction,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        title: Text(
          'Activity',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _newRecentlyActiveView('오늘'),
            _newRecentlyActiveView('이번주'),
            _newRecentlyActiveView('이번달'),
          ],
        ),
      ),
    );
  }
}
