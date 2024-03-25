import "package:flutter/material.dart";
import "package:project/class23_Provider/provider/album_provider.dart";
import "package:provider/provider.dart";
import "../model/album.dart";


class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();

}



class _AlbumViewState extends State<AlbumView> {
  late List<Album> albumList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Album List"),
      ),
      body: Consumer<AlbumProvider>(
        builder: (context, provider, child) {
          albumList = provider.getAlbumList(); //앨범리스트를 가지고 올 수 있음
          return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${albumList[index].id}: ${albumList[index].title}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}
