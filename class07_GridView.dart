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
        title: const Text("GridView"),
      ),
      body: GridView(
        /*
        gridDelegate: 레이아웃을 컨트롤하는 요소
         */
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, //가로축 두 줄
            crossAxisSpacing: 15.0, // 열 사이 공간
            mainAxisSpacing: 12.0 //메인 축을 기점으로 한 공간 명시
        ),
        children: [
          postContainer(number: "1" ,colorData: Colors.amber),
          postContainer(number: "2" ,colorData: Colors.blue),
          postContainer(number: "3" ,colorData: Colors.red),
          postContainer(number: "4" ,colorData: Colors.orange),
          postContainer(number: "5" ,colorData: Colors.amber),
          postContainer(number: "6" ,colorData: Colors.blue),
          postContainer(number: "7" ,colorData: Colors.red),
          postContainer(number: "8" ,colorData: Colors.orange),
          postContainer(number: "9" ,colorData: Colors.amber),
          postContainer(number: "10" ,colorData: Colors.blue),
          postContainer(number: "11" ,colorData: Colors.red),
          postContainer(number: "12" ,colorData: Colors.orange)
        ],
      ),
    );
  }

  Widget postContainer({String number = "0", Color colorData = Colors.amber}) {
    return Container(
      height: 200,
      color: colorData,
      child: Center(child: Text("Box $number")),
    );
  }
}
