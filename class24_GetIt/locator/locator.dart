import 'package:get_it/get_it.dart';
import '../service/album_service.dart';
/*
locator 자체가 찾는다 라는 뜻으로
이 파일에 필요한 것을 모두 등록 하고
여기에 연결 하여 바로 사용할 수 있게 함
*/
GetIt locator = GetIt.instance;

initLocator() {
  locator
      .registerLazySingleton<AlbumService>(() => AlbumServiceImplementation());
}
