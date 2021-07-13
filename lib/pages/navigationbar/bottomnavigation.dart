import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/home/home_page.dart';
import 'package:umrahhaji/pages/modul%20ebook/screen_ebook.dart';
import 'package:umrahhaji/pages/product/product.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_option/qna_option.dart';
import 'package:umrahhaji/pages/umrahhaji_tv/list_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  List listMenu = [
    HomePage(),
    QnAOption(),
    ListScreen(),
    ProductPage(),
    ScreenEbook(),
    ScreenEbook(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
          opacity: 0.2,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),
          currentIndex: currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.home, color: Colors.black),
                activeIcon: Icon(Icons.home, color: Colors.black),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.article_rounded, color: Colors.black),
                activeIcon: Icon(Icons.article_rounded, color: Colors.black),
                title: Text("Articles")),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.live_tv_rounded, color: Colors.black),
                activeIcon: Icon(Icons.live_tv_rounded, color: Colors.black),
                title: Text("TV")),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
                activeIcon:
                    Icon(Icons.shopping_cart_rounded, color: Colors.black),
                title: Text("Shop")),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.menu_book_rounded, color: Colors.black),
                activeIcon: Icon(Icons.menu_book_rounded, color: Colors.black),
                title: Text("Ebook")),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.account_circle_rounded, color: Colors.black),
                activeIcon:
                    Icon(Icons.account_circle_rounded, color: Colors.black),
                title: Text("Profile")),
          ]),
      body: listMenu[currentIndex],
    );
  }
}
