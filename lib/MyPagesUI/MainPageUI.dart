import 'package:azkar_muslim/My_Data/FavoritesData.dart';
import 'package:azkar_muslim/MyPagesUI/HomePage.dart';
import 'package:azkar_muslim/MyPagesUI/favoriteUI.dart';
import 'package:azkar_muslim/MyPagesUI/AboutAppUI.dart';
import 'package:flutter/material.dart';

class mainPageUI extends StatefulWidget {
  const mainPageUI({super.key});

  @override
  State<mainPageUI> createState() => _mainPageUIState();
}

class _mainPageUIState extends State<mainPageUI> {
  HomeUI homeUI = HomeUI();
  int PageIndex = 2;
  late final MyPages = [
    AboutAppUI(),
    favoriteUI(),
    HomeUI(
      onSettingsTap: () {
        setState(() {
          PageIndex = 0;
        });
      },
    ),
  ];
  @override
  void initState() {
    super.initState();
    FavoritesData.Load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPages[PageIndex],

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: const Color.fromARGB(255, 30, 71, 43),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            PageIndex = index;
          });
        },
        currentIndex: PageIndex,
        selectedItemColor: Color.fromARGB(255, 221, 171, 19),
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "عن التطبيق"),

          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: "المفضلة",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
        ],
      ),
    );
  }

}