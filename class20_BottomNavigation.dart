import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() =>
    _selectedIndex = _tabController.index)); // setState를 통해 플러터의 상태 업데이트 가능
  }

  @override
  void dispose() {
    //페이지가 종료 됐을 때, 불필요한 내용을 지워 줌
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation"),
      ),
      body: _selectedIndex == 0 //버튼을 누를 때 화면이 바뀌는 기능
          ? tabContainer(context, Colors.indigo, "Friends Tab")
          : _selectedIndex == 1
          ? tabContainer(context, Colors.amber[600] as Color, "Chat Tab")
          : tabContainer(context, Colors.blueGrey, "Settings Tab"),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        tabs: [
          Tab(
            icon: Icon(
              //버튼을 누를 때 테두리가 진해지도록 활성화
                _selectedIndex == 0 ? Icons.person : Icons.person_2_outlined
            ),
            text: "Friends",
          ),
          Tab(
            icon: Icon(
                _selectedIndex == 1 ? Icons.chat : Icons.chat_outlined
            ),
            text: "Chats",
          ),
          Tab(
            icon: Icon(
                _selectedIndex == 1 ? Icons.settings : Icons.settings_outlined
            ),
            text: "Settings",
          ),
        ],
      ),
    );
  }

  Widget tabContainer(BuildContext con, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(con).size.width,
      height: MediaQuery.of(con).size.height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
