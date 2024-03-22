import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String youtubeId = '1Sw0yFdnTWo';

  final YoutubePlayerController _con = YoutubePlayerController(initialVideoId: youtubeId,
      flags: const YoutubePlayerFlags(autoPlay: false));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
      ),
      body: Container(
        child: YoutubePlayer(
          controller: _con,
        ),
      ),
    );
  }
}
