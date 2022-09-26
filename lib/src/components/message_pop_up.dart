import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MessagePopUp extends StatelessWidget {
  final String? title;
  final String? messgae;
  final Function()? okCallback;
  final Function()? cancelCallback;

  const MessagePopUp(
      {super.key,
      required this.title,
      required this.messgae,
      required this.okCallback,
      this.cancelCallback});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.7,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    messgae!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: okCallback, child: Text('확인')),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: cancelCallback,
                        child: Text(
                          '취소',
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
