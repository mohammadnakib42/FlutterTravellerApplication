import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller/pages/navpages/bar_item_page.dart';
import 'package:traveller/pages/navpages/home_page.dart';
import 'package:traveller/pages/navpages/my_page.dart';
import 'package:traveller/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HoemPage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text("Bar"),
            //backgroundColor: Colors.black,
            icon: Icon(
              Icons.bar_chart_sharp,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
