import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/album.dart';

class AlbumProvider with ChangeNotifier {
  final List<Album> _albumList = List.empty(growable: true); //"growable: true" 사이즈 증가가 가능함

  List<Album> getAlbumList() {
    _fetchAlbums();
    return _albumList;
  }

  void _fetchAlbums() async {

    final response = await http
       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    final List<Album> result = jsonDecode(response.body)
        .map<Album>((json) => Album.fromJson(json)) //엘범형태로 받아줌
        .toList(); //앨범 객체를 포함하는 리스트 반환

    _albumList.clear(); //기존에 있던것을 지워주고 새로운 데이터 저장
    _albumList.addAll(result);
    notifyListeners(); //상태가 변함을 알려줌

  }
}