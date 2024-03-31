import 'package:flutter/material.dart';
import 'package:project/class30_Form/successPage.dart';
import 'package:project/class30_Form/user.dart';

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
      initialRoute: '/', //초기의 루트를 어떻게 할 것인가
      routes: {
        '/': (context) => const HomePage(),
        '/success': (context) => const SuccessPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<FormState>(); //유니크하게 요소들을 확인한다. 접근성을 부여해준다.
  late String _username, _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _key,
          child: Column(
            children: [
              usernameInput(),
              const SizedBox(height: 15),
              emailInput(),
              const SizedBox(height: 15),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameInput() {
    return TextFormField(
      autofocus: true,
      //어플을 켰을 때 입력칸이 있으면 커서를 켜놔서 바로 입력이 가능하게 만드는 기능
      validator: (val) {
        if (val!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      onSaved: (username) => _username = username as String,
      //키보드가 올라오고 입력을 마쳤을 때
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: '사용자 이름을 입력하시오', //html에서 input안에 어떤 글자가 보일지 보여주는 기능을 수행
          labelText: 'Username',
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget emailInput() {
    return TextFormField(
      autofocus: true, //어플을 켰을 때 입력칸이 있으면 커서를 켜놔서 바로 입력이 가능하게 만드는 기능
      validator: (val) {
        if (val!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      onSaved: (email) => _email = email as String,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: '사용자 이메일을 입력하시오',
          labelText: 'Email',
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (_key.currentState!.validate()) {
            _key.currentState!.save(); //자동으로 onSaved: 호출해준다고 생각하면된다
            Navigator.pushNamed(context, '/success',
                arguments: User(_username, _email)); //arguments: username과 email 전달
          }
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: const Text("제출", style: TextStyle(fontSize: 18)),
        ));
  }
}
