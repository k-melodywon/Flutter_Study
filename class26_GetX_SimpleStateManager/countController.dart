import 'package:get/get.dart';

class CountController extends GetxController {
  int _counter= 0;

  int get counter => _counter;

  void increase(){
    _counter++;
    update(); //계속 update가 호출된다는 점에서 번거로움
  }

  void decrease(){
    _counter--;
    update();
  }
}