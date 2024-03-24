import './album.dart';

//엘범의 리스트를 담는 역할
class Albums {

  late List<Album> albums;
  Albums({required this.albums});
  Albums.fromJSON(List<dynamic> json) {
    albums = List<Album>.empty(growable: true);
    for (dynamic val in json) { //반복문을 통해 리스트에 추가
      albums.add(Album.fromJSON(val));
    }
  }
}