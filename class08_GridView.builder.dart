
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final postList = [
    {
      "number": "0",
      "color": Colors.amber,
    },
    {
      "number": "1",
      "color": Colors.red,
    },
    {
      "number": "2",
      "color": Colors.blue,
    },
    {
      "number": "3",
      "color": Colors.green,
    },
    {
      "number": "4",
      "color": Colors.yellow,
    },
    {
      "number": "5",
      "color": Colors.purple,
    },
    {
      "number": "6",
      "color": Colors.lightGreenAccent,
    },
    {
      "number": "7",
      "color": Colors.redAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GridView.Builder"),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //고정값이므로 const를 붙여주는 게 좋다
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: postList.length,
          itemBuilder: (BuildContext con, int index) {
            return postContainer(
              number: postList[index]["number"] as String,
              colorData: postList[index]["color"] as Color,
            );
          },
        )
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
