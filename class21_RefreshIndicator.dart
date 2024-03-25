import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); // MyHomePage 위젯 클래스 선언

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // 상태를 관리하는 State 클래스를 생성하는 메서드
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Product>> productList; // 제품 리스트를 저장할 Future 변수 선언
  Dio dio = Dio(); // HTTP 요청을 보내기 위한 Dio 객체 생성

  @override
  void initState() { // State 객체 초기화
    super.initState();
    productList = getProductData(); // 데이터를 비동기적으로 받아오는 함수 호출
  }

  Future<List<Product>> getProductData() async { // 제품 데이터를 가져오는 비동기 함수
    late List<Product> products; // 제품 리스트 변수 선언

    try {
      var response = await dio.get("https://dummyjson.com/products"); // 외부 URL에서 제품 데이터 가져오기
      products = response.data['products']
          .map<Product>((json) => Product.fromJson(json)).toList(); // JSON 데이터를 Product 객체로 변환하여 리스트에 저장
      print("refreshed!"); // 데이터를 가져왔음을 확인하는 출력문
    } catch (e) {
      print(e); // 오류 발생 시 출력
    }

    return products; // 제품 리스트 반환
  }

  // 데이터를 새로고침하는 메서드
  Future<void> refreshData() async {
    productList = getProductData(); // 제품 데이터 다시 받아오기
    setState(() {}); // 화면 갱신
  }

  @override
  Widget build(BuildContext context) { // 화면을 구성하는 위젯을 빌드하는 메서드
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refresh Indicator"), // 앱바에 제목 표시
      ),
      body: RefreshIndicator( // 새로고침을 지원하는 위젯
        onRefresh: () => refreshData(), // 새로고침 동작 설정
        child: SingleChildScrollView( // 단일 자식을 스크롤 가능한 위젯으로 감싸는 위젯
          physics: const AlwaysScrollableScrollPhysics(), // 항상 스크롤 가능하도록 설정
          child: FutureBuilder<List<Product>>( // 비동기 작업 결과에 따라 UI를 구축하는 위젯
            future: productList, // 비동기 작업을 수행하는 Future를 설정
            builder: (BuildContext context, AsyncSnapshot snapshot) { // UI를 구축하는 빌더 함수
              if (!snapshot.hasData) { // 데이터가 없는 경우
                return const Center( // 화면 중앙에 로딩 표시
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else { // 데이터가 있는 경우
                return ListView.builder( // 리스트를 동적으로 생성하는 위젯
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // 스크롤 불가능하도록 설정
                  itemCount: snapshot.data.length, // 리스트 아이템 개수 설정
                  itemBuilder: (BuildContext context, int index) { // 각 아이템을 생성하는 빌더 함수
                    var data = snapshot.data[index]; // 현재 아이템 데이터 가져오기
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black26),
                      ),
                      child: Text("${data.title}(${data.description})"), // 아이템 제목과 설명 출력
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
