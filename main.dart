import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

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
      body: Container(// 이미지의 종류는 assets(블로그 참조) 이미지와 network 이미지가 있음
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
