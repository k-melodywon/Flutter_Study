import '../dataSource/dataSource.dart';

import '../model/album.dart';

//Repository는 데이터 필터링이 필요할 때 사용
class AlbumRepository {
  final DataSource _dataSource = DataSource();

  Future<List<Album>> getAlbumList() {
    return _dataSource.getAlbumList();
  }
}
