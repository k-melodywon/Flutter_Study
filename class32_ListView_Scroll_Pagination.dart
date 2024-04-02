import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _url = 'https://jsonplaceholder.typicode.com/album';
  int _page = 1;
  final int _limit = 20;
  bool _hasNextPage = true; //다음 페이지가 있는 경우
  bool _isFirstLoadRunning = false; //첫번째로 로딩이 되었는지
  bool _isLoadMoreRunning = false; //추가적으로 로딩할 부분이 있는지
  List _albumList = [];

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _initLoad();
    _controller = ScrollController()..addListener(_nextLoad);
  }

  //초기 로딩

  void _initLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
          await http.get(Uri.parse("$_url?_page=$_page&_limit-$_limit"));
      setState(() {
        //데이터 적제
        _albumList = jsonDecode(res.body);
      });
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _nextLoad() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 100) { //페이지 끝남을 감지하는 속도
      //스크롤 가능 뷰포트
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1;
      try {
        final res =
            await http.get(Uri.parse("$_url?_page=$_page&_limit-$_limit"));
        final List fetchedAlbums = json.decode(res.body);
        if (fetchedAlbums.isEmpty) {
          setState(() {
            _albumList.addAll(fetchedAlbums);
          });
        } else {
          setState(() {
            //다음 페이지가 없는 경우
            _hasNextPage = false;
          });
        }
      } catch (e) {
        print(e.toString());
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_nextLoad); //안 해도 되지만 여러 페이지의 경우 권장
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Pagination'),
        ),
        body: _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                Expanded(
                  //반응형 만들 떄 사용
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _albumList.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        title: Text(_albumList[index]['id'].toString()),
                        subtitle: Text(_albumList[index]['title']),
                      ),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.all(20),
                    //더이상 데이터가 없음
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        "No more data to be fatched",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
              ]));
  }
}
