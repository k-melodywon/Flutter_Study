import '../model/albums.dart';
import '../repository/album_repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumBloc {
  final AlbumRepository _albumRepository = AlbumRepository();
  final PublishSubject<Albums> _albumFetcher = PublishSubject<Albums>(); //앨범을 가져오는 stream을 만들어준다.

  Stream<Albums> get allAlbums => _albumFetcher.stream;//UI 접근
  Future<void> fetchAllAlbums() async {
    Albums albums = await _albumRepository.fetchAllAlbums();
    _albumFetcher.sink.add(albums); //스트림 반영
  }

  dispose() {
    _albumFetcher.close(); //필요없을 땐 stream을 닫아준다
  }
}