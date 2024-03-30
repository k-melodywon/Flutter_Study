import 'package:get/get.dart';
import 'studentModel.dart';

class StudentController extends GetxController {
  RxList<Rx<Student>> studentList = [
    Student(studentId: 1, studentName: "Yeowon", studentGrade: "A").obs,
    Student(studentId: 2, studentName: "Sunwoo", studentGrade: "B").obs,
    Student(studentId: 3, studentName: "Jisoo", studentGrade: "C").obs,
  ].obs; //obs: 관찰자

  List<String> newStudentNames = ["Yeowon2", "Sunwoo2", "Jisoo2"];
  List<String> newStudentGrades = ["A+", "B+", "C+"];

  void updateStudentName(String name, int index) {
    studentList[index].update((val) { //index를 통해 접근
      val?.studentName = name;
    });
  }

  void updateStudentGrade(String grade, int index) {
    studentList[index].update((val) {
      val?.studentGrade = grade;
    });
  }
}
