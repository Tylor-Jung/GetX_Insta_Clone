import 'package:flutter/material.dart';
import 'package:instargram_clone/src/components/avatar_widget.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.userId, required this.descriotion});

  final String? userId;
  final String? descriotion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            top: 0,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(height: 10),
                AvatarWidget(
                  type: AvatarType.TYPE2,
                  thumbPath:
                      'https://i.pinimg.com/originals/1d/fe/d1/1dfed1391d2b7de7015e76cb8d3a423a.jpg',
                  size: 80,
                ),
                const SizedBox(height: 10),
                Text(
                  userId!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Text(
                  descriotion!,
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('팔로우 하기'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              child: const Icon(
                Icons.close,
                size: 15,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
