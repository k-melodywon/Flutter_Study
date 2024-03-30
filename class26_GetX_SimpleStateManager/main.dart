import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'countController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //var a = Get.put(CountController()); 이것도 사용 방법중 하나
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Example'),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CountController>( //GetBuilder를 사용해서 Provider과 다른게 없음
                init: CountController(),
                builder: (_) =>
                    Text("현재 카운트: ${Get
                        .find<CountController>()
                        .counter}"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Get.find<CountController>().increase(),
                    child: const Text("증가"),
                  ),
                  TextButton(
                    onPressed: () => Get.find<CountController>().decrease(),
                    child: const Text("감소"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
   );
  }
}