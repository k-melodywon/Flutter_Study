import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:project/class31_MVVC/viewModel/albumViewModel.dart';

import 'package:project/class31_MVVC/view/albumView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumViewModel>( //ChangeNotifierProvider:  어떤 모델을 호출할 것인가
        create: (context) => AlbumViewModel(),
        child: const AlbumView(),
      ),
    );
  }
}
