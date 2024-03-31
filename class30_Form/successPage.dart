import 'package:flutter/material.dart';
import 'package:project/class30_Form/user.dart';

//메인페이지에서 성공적으로 데이터를 옮겼을 때 나오게 할 화면
class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final User args = ModalRoute.of(context)!.settings.arguments as User; //argument를 받아옴

    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //이전으로 돌아가는 방법
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text("Test App"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Successfully submitted!"),
            Text("Username: ${args.username}"),
            Text("Email: ${args.email}"),
          ],
        ),
      ),
    );
  }
}
