// home_screen.dart
// 홈버튼 구현

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  // controller의 기본 상태가 null인 상태로 선언

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'UnderTale',
        ),
        actions: [
          IconButton(
              // 아이콘 버튼 형식
              onPressed: () {
                // 아이콘 눌렀을 시 실행하는 콜백 함수

                if (controller != null) {
                  // 입력된 controller가 있을 경우 - 웹뷰가 실행된 경우

                  controller!.loadUrl('https://blog.naver.com/13aesz');
                  // 이하 링크로 이동
                  // controller가 null이 될 수 있는 변수이기 때문에 ! 입력 필요
                }
              },
              icon: Icon(
                Icons.home,
              ))
        ],
      ),

      // WebView
      body: WebView(
        initialUrl: 'https://blog.naver.com/13aesz',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
