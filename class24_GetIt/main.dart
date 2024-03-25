import 'package:flutter/material.dart';
import 'locator/locator.dart';
import 'model/album.dart';
import 'service/album_service.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GetIt 테스트',
      home: TestView(),
   );
 }
}

class TestView extends StatefulWidget {

  const TestView({super.key});
  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final AlbumService _service = locator<AlbumService>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get It 예제"),
      ),
      body: FutureBuilder(
        future: _service.fetchAlbums(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Album>? list = snapshot.data;
            return ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: Text("${list?[index].id}: ${list?[index].title}"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("오류 발생"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
    );
  }
}
