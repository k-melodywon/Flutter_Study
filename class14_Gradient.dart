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
        title: const Text("Test App"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              colors: [
                Colors.amber[100] as Color,
                Colors.amber[200] as Color,
                Colors.amber[300] as Color,
              ],
              stops: const [0.1,0.2,0.3],
              radius: 1.0, //숫자가 커질수록 그라데이션 범위가 넓어짐
            )
        ),
      ),
    );
  }
}