import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) { //Widget build에서 필요한 UI를 그린다.
    return Scaffold( //Scaffold 뼈대라는 뜻으로 주로 구조를 그릴 때 사용
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
      drawer: Drawer(
        child: ListView( //여러 위젯을 열 때 유용
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Drawer Header Part"),
            ),
            ListTile(
              title: Text("Menu 1"),
            ),
          ],
        ),
      ),
      body: Center(//Center 위젯: 가운데 정렬 시에 사용
        child: Text("HELLO WORLD"),
      ),
      floatingActionButton: FloatingActionButton( //floatingActionButton 버튼을 화면에서 둥둥 뜨게 하는 역할
        onPressed: () => print("clicked"), //onPressed 버튼이 눌린 것을 감지
        child: const Icon(Icons.mouse),
      ),
    );
  }
}
