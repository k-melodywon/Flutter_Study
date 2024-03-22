import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static Future loadJson() async { //async: 비동기, Future: 비동기적 계산의 결과
    final String response = await rootBundle.loadString("lib/use2rs.json");
    final data = await json.decode(response);
    return data['users'];
  }

  Future userList  = loadJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Data"),
        ),
        body: FutureBuilder(
          future: userList,
          builder: (context,snapshot){
            if (snapshot.hasData) { //데이터가 있는지 확인
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Text("${snapshot.data[index]['id']} : ${snapshot.data[index]['username']} "),
                  );
                },
              );
            } else if (snapshot.hasError){
              return const Center(child: Text("Error"));
            } else {
              return const Center(child: CircularProgressIndicator(strokeWidth: 2)); //로딩중
            }
          },
        )
    );
  }
}
