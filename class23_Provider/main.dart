import 'package:flutter/material.dart';
import 'package:project/class23_Provider/provider/album_provider.dart';
import 'package:project/class23_Provider/view/album_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumProvider>(
     create: (context) => AlbumProvider(),
        child: const AlbumView(),
      ),
    );
  }
}
