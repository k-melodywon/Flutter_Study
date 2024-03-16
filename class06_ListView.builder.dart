
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
      "title":"Sample Title 1",
      "color":Colors.purple,
    },
    {
      "title":"Sample Title 2",
      "color":Colors.green,
    },
    {
      "title":"Sample Title 3",
      "color":Colors.blue,
    },
    {
      "title":"Sample Title 4",
      "color":Colors.yellow,
    },
    {
      "title":"Sample Title 5",
      "color":Colors.red,
    },
    {
      "title":"Sample Title 6",
      "color":Colors.orange,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text Title"),
        ),
        body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (BuildContext con, int index) {
            return postContainer(
              /*
                각 데이터 타입에 맞게 "as 타입명"을 추가해 줘야함
                 */
              title: postList[index]["title"] as String,
              colorData: postList[index]["color"] as Color,
            );
          },
        )
    );
  }
  Widget postContainer({String title = '', Color colorData = Colors.yellow}) { //title과 color 값을 받아
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 200,
          color: colorData,
        )
      ],
    );
  }
}
