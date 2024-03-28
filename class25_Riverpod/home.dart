import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RiverPod Example",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeView(),
    );
  }

}

class HomeView extends ConsumerWidget {

  HomeView({Key? key}) : super(key: key);
  final counterProvider = StateNotifierProvider((ref) => Counter());

  @override
  Widget build(BuildContext context, WidgetRef ref) { //WidgetRef: 위젯이 프로바이더와 상호작용할 수 있게 하는 객체
    final count = ref.watch(counterProvider); //watch: counterProvider를 지켜봄
    ref.listen(
      counterProvider,
      ((prev, next) { //이전깂과 다음값
        print("상태 반영: $prev, $next");
      }),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count: ${count.toString()}",
            ),

            const SizedBox(height: 20),
            TextButton(
              onPressed: () => ref.watch(counterProvider.notifier).increment(),
              child: const Text(
                "증가",
              ),
            ),
          ],

        ),
      ),
    );
  }
}

class Counter extends StateNotifier<int> { //StateNotifier 일부 로직을 공유하고 값을 변경할 수 있는 애를 변경 시킴
  Counter() : super(0);

  void increment() => state++;
}