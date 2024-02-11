// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

// PageController

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageController 설정
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        // pageController 동작 설정

        // 현재 페이지 가져오기
        int? np = pageController.page?.toInt();

        if (np == null) {
          // 페이지값이 없을 경우
          return;
        }

        if (np == 4) {
          // 마지막 페이지일 경우
          // 첫 페이지로 넘어가도록 설정
          np = 0;
        } else {
          // 다음 페이지 설정
          np++;
        }

        pageController.animateToPage(
          // 페이지 변경
          np, // 이동할 페이지 int값
          duration: Duration(milliseconds: 500),
          curve: Curves.ease, // 애니메이션 작동 방식
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView(
        // PageView에 컨트롤러 설정
        controller: pageController,
        children: [1, 2, 3, 4, 5]
            .map(
              (n) => Image.asset(
                'assets/img/image_$n.png',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }
}
