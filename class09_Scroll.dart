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
        title: const Text("Scroll"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox( //범위 박스를 만들어 구분
                height: MediaQuery.of(context).size.height/3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.green,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
            ),
            SizedBox( //범위 박스를 만들어 구분
                height: MediaQuery.of(context).size.height/3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.purple,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}