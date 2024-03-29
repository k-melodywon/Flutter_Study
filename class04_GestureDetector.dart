import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text Title"),
        ),
        body: Center( //Center 가운데 정렬 위젯
            child: GestureDetector( //GestureDetector: 도형 같은 버튼 감지
              onTap: () => print("GestureDetector used"), //도형을 누르면 콘솔에 내용 출력
              child: Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
              ),
            )
        )
    );
  }
}

/*class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text Title"),
        ),
        body: Center( //Center 가운데 정렬 위젯
            child: TextButton(
              //onPressed: 버튼을 누르면 콘솔창에 TextButton clicked가뜬다
              onPressed: () => print("TextButton clicked"),
              child: const Text("Text Button"), //버튼이름
            )
        )
    );
  }
}*/


