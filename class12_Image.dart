import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLK23lgtdb8w-dM8rzDcECUUrGjuWKMncU_g&s';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Image(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.contain, //지정된 크기 내에서 알맞게 사진이 들어감
        ),
      ),
    );
  }
}