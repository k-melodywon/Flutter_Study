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
      body: ListView(
      scrollDirection: Axis.horizontal,
      children: [
      postContainer(title: "Title 1", colorData: Colors.yellow),
      postContainer(title: "Title 2", colorData: Colors.blue),
      postContainer(title: "Title 3", colorData: Colors.green),
      postContainer(title: "Title 4", colorData: Colors.red),
      postContainer(title: "Title 5", colorData: Colors.purple),
      ],
    )
    );
  }
  Widget postContainer({String title = '', Color colorData = Colors.yellow}) {
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
