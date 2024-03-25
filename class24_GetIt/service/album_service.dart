import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/album.dart';

abstract class AlbumService { //추상화
  Future<List<Album>> fetchAlbums(); //Future(비동기 작업을 가져오기 위해 사용)형태로 가져옴
}


class AlbumServiceImplementation implements AlbumService {

  @override
  Future<List<Album>> fetchAlbums() async {
    try { //오류확인을 위해 try catch문 사용
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

      final List<Album> result = jsonDecode(response.body)
          .map<Album>((json) => Album.fromJson(json))
          .toList();

      return result;
    } catch (e) {
      throw (e.toString());
    }
  }

}
