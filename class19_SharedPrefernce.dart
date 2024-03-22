import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SharedPreferences _prefs;
  String _username = "";
  final TextEditingController _usernameController = TextEditingController();
  /*디스크에 간단하게 데이터를 저장하고
  어플을 다시 켰을 때 데이터를 불러와야하는 경우가 있음
  그 경우에 대비한 강의
   */
  @override
  void initState(){ //초기화
    super.initState();
    _getUsername();
  }

  //사용자 이름을 변경하고 저장할 때 필요한 메서드
  _saveUsername(){
    setState(() { //상태 업데이트를 위해 setState는 꼭 써줘야함
      _username = _usernameController.text;
      _prefs.setString("currentUsername",_username);//String 저장
    });
  }

  _getUsername() async {//데이터의 양이 방대해 지는 경우 때문에 비동기로 처리
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _username =  _prefs.getString("currentUsername") ?? ""; //?? "" : null 값이 들어가게 지정
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreference"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("현재 사용자 이름: $_username"),
            Container(
              child: TextField(
                controller: _usernameController,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Input your username',
                ),
              ),
            ),
            TextButton(
                onPressed: () => _saveUsername(),
                child: const Text("저장")
            )
          ],
        ),
      ),
    );
  }
}
