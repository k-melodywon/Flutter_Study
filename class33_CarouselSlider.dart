import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List imageList = [
    "https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg",
    "https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/06/19/20/13/sunset-815270_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/01/08/05/24/sunflower-1127174_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carousel Slider'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                  children: [
                    sliderWidget(),
                    sliderIndicator(),
                  ]
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text("Welcome to the carousel slider app"),
            )
          ],
        )
    );
  }

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map(
              (imgLink) {
            return Builder(
                builder: (context) {
                  return SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Image(
                      fit: BoxFit.fill,
                      /*
                     AssetImage: 저장된 이미지를 불러오는 것
                     NetworkImage: 링크로 이미지를 불러오는 것
                      */
                      image: NetworkImage(
                        imgLink,
                      ),
                    ),
                  );
                }
            );
          }
      ).toList(),
      options: CarouselOptions(
          height: 300,
          viewportFraction: 1.0,
          //채울양 지정
          autoPlay: true,
          //자동으로 슬라이드를 넘길것인가 말것인가
          autoPlayInterval: const Duration(seconds: 4),
          //넘어가는 시간 지정
          onPageChanged: (index, reason) { //슬라이드가 어느 슬라이드에 있는지 알려준다.
            setState(() {
              _current = index;
            });
          }
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList
            .asMap()
            .entries
            .map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key), //키값을 추적하여 보내줌
            child: Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(
                    _current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
