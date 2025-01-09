import 'package:demo_app/screens/homePage/home_page.dart';
import 'package:demo_app/screens/libraryPage/library_page.dart';
import 'package:demo_app/screens/writePage/write_page.dart';
import 'package:demo_app/ui/main/home_page.dart';
import 'package:demo_app/ui/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppDemo extends StatefulWidget {
  const AppDemo({super.key});

  @override
  State<AppDemo> createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
  int papeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: papeIndex,
      children: [
        TrangChu(),
        SearchPage(),
        LibraryPage(),
        WritePage(),
        Center(
          child: Text(
            "Updates Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    return SalomonBottomBar(
        currentIndex: papeIndex,
        onTap: (index) {
          setState(() {
            papeIndex = index;
          });
        },
        items: List.generate(Footer.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: Icon(Footer[index]['icon']),
              title: Text(Footer[index]['text']));
        }));
  }
}

const List Footer = [
  {
    "icon": LineIcons.home,
    "text": "Home",
  },
  {
    "icon": LineIcons.search,
    "text": "Search",
  },
  {
    "icon": LineIcons.archive,
    "text": "Library",
  },
  {
    "icon": LineIcons.pen,
    "text": "Write",
  },
  {
    "icon": LineIcons.bell,
    "text": "Updates",
  }
];
