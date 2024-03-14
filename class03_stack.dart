
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
      body: Container(
        width: MediaQuery.of(context).size.width, // 전체 배경색 추가
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top: 50, left: 50),
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top: 100, left: 100),
              color: Colors.green,
            ),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top: 150, left: 150),
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}


