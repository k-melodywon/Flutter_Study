import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'studentController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final StudentController _con = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Example APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Example'),
        ),
        body: ListView.builder(
          itemCount: _con.studentList.length, //길이를 가져옴
          itemBuilder: (BuildContext con, int index) {
            return Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  GetX<StudentController>(
                    builder: (_) => Text(
                      "ID: ${_con.studentList()[index]().studentId}, Name: ${_con.studentList()[index]().studentName}, Grade: ${_con.studentList()[index]().studentGrade}",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => _con.updateStudentName(
                            _con.newStudentNames[index], index), //인덱스로 전달
                        child: const Text("이름 변경"),
                      ),
                      TextButton(
                        onPressed: () => _con.updateStudentGrade(
                            _con.newStudentGrades[index], index),
                        child: const Text("성적 변경"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
