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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AlertDialog"),
      ),
      body: Container(
       child: Center(
         child: TextButton(
           onPressed: (){
             showDialog(
                 context: context,
                 builder: (BuildContext con){
                   return AlertDialog(
                     title: const Text("Dialog Title"),
                     content: SingleChildScrollView( //내용이 길어지더라도 스크롤로 볼 수 있게 함
                       child: Container(
                         child: const Text("Dialog Content"),
                       ),
                     ),
                     actions: [
                       TextButton(
                         onPressed: () => Navigator.of(context).pop(),
                         child: const Text("Yes"),
                       ),
                       TextButton(
                           onPressed: () => Navigator.of(context).pop(),
                           child: const Text("Close"),
                       )
                     ],
                   );
                 }
             );
           },
           child: const Text("Button"),
         ),
       ),
      ),
    );
  }
}
