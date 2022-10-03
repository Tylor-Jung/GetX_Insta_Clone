import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instargram_clone/src/components/avatar_widget.dart';
import 'package:instargram_clone/src/components/image_data.dart';
import 'package:instargram_clone/src/components/post_widget_components.dart';
import 'package:instargram_clone/src/controller/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
            size: 70,
            type: AvatarType.TYPE2,
            thumbPath:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7vojc0_0uNUmdWuhnjuvbxaXyMZxT5BckBQ&usqp=CAU'),
        Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
          // ... 은 '리스트 배열을 나열하겠다' 라는 의미
          100,
          (index) => AvatarWidget(
            type: AvatarType.TYPE1,
            thumbPath:
                'https://scontent.fmel7-1.fna.fbcdn.net/v/t1.6435-9/46331497_2223622827875215_6618781732575379456_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=l8YHzwCMdEkAX8UgiC0&tn=UQD3rNcwwvtB01Fu&_nc_ht=scontent.fmel7-1.fna&oh=00_AT-yULjIwMiENLRibejZisriH075SW_3OFIqwk9bguoykQ&oe=63589EA1',
          ),
        ),
      ]),
    );
  }

  Widget _postList() {
    return Obx(() => Column(
          children: List.generate(
            controller.postList.length,
            (index) => PostWidget(post: controller.postList[index]),
          ).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(IconsPath.logo, width: 270),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPath.directMessage, width: 50),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
