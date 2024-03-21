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
        title: const Text("Button"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: ElevatedButton(
                  /*
                style: ElevatedButton.styleFrom 을 통해
                버튼을 꾸밀 수 있음
                 */
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => print("Elevated Button"),
                  child: const Text("ElevatedButton"),
                )
            ),
            Center(
              child: TextButton(
                onPressed: () => print("Text Button"),
                child: const Text("TextButton"),
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () => print("Outlined Button"),
                child: const Text("OutlinedButton"),
              ),
            )
          ],
        ),
      ),
    );
  }
}