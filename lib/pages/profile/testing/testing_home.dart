import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/pages/home/article_homepage/list_article_homepage.dart';
import 'package:umrahhaji/pages/home/article_homepage/wp-article-homepage.dart';
import 'package:umrahhaji/pages/modul%20ebook/screen_ebook.dart';
import 'package:umrahhaji/pages/product/product.dart';
import 'package:umrahhaji/pages/profile/testing/testing_profile.dart';
import 'package:umrahhaji/pages/soal_jawab/post_home.dart';
import 'package:umrahhaji/pages/umrahhaji_tv/list_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:umrahhaji/services/auth.dart';
import 'package:umrahhaji/services/database_service.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Users user = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.lightGreen[50],
            //Bottom Navigation Bar
            bottomNavigationBar: BubbleBottomBar(
                opacity: 0.2,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),
                currentIndex: currentIndex,
                hasInk: true,
                inkColor: Colors.black12,
                hasNotch: true,
                //fabLocation: BubbleBottomBarFabLocation.center,
                onTap: changePage,
                items: <BubbleBottomBarItem>[
                  BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.home, color: Colors.black),
                    activeIcon: GestureDetector(
                        child: Icon(Icons.home, color: Colors.black),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(uid: widget.uid)));
                        }), //Route to HomePage
                    title: GestureDetector(
                        child: Text("Home"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(uid: widget.uid)));
                        }), //Route to HomePage
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.article_rounded, color: Colors.black),
                    activeIcon: GestureDetector(
                        child: Icon(Icons.article_rounded, color: Colors.black),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostHome()));
                        }),
                    title: GestureDetector(
                        child: Text("Articles"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostHome()));
                        }), //Route to Articles
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.live_tv_rounded, color: Colors.black),
                    activeIcon: GestureDetector(
                        child: Icon(Icons.live_tv_rounded, color: Colors.black),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListScreen()));
                        }),
                    title: GestureDetector(
                        child: Text("TV"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListScreen()));
                        }), //Route to UmrahHaji TV
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon:
                        Icon(Icons.shopping_cart_rounded, color: Colors.black),
                    activeIcon: GestureDetector(
                        child: Icon(Icons.shopping_cart_rounded,
                            color: Colors.black),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage()));
                        }),
                    title: GestureDetector(
                        child: Text("Shop"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage()));
                        }), //Route to Shop
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.menu_book_rounded, color: Colors.black),
                    activeIcon: GestureDetector(
                        child:
                            Icon(Icons.menu_book_rounded, color: Colors.black),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenEbook()));
                        }),
                    title: GestureDetector(
                        child: Text("Ebook"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenEbook()));
                        }), //Route to eBook
                  ),
                  BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon:
                        Icon(Icons.account_circle_rounded, color: Colors.black),
                    activeIcon: GestureDetector(
                        child: Icon(Icons.account_circle_rounded,
                            color: Colors.black),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile(
                                        uid: widget.uid,
                                      )));
                        }),
                    title: GestureDetector(
                        child: Text("Profile"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile(
                                        uid: widget.uid,
                                      )));
                        }), //Route to Profile
                  ),
                ]),
            body: Center(
              child: ListView(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child:
                              Image.asset("assets/images/umrahhajilogo.png"))),
                  //Image Slider on top
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      viewportFraction: 1,
                    ),
                    items: [
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageslider1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageslider2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageslider3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageslider4.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageslider5.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/imageslider6.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  //Quote
                  SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.center,
                            image:
                                AssetImage('assets/images/orange-kerawang.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: new Column(
                        children: <Widget>[
                          Container(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new SizedBox(
                                  height: 3.0,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Anugerah terindah, menjadi tetamu Allah.',
                                        textAlign: TextAlign.center,
                                        style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Impian setiap Muslim',
                                        textAlign: TextAlign.center,
                                        style: new TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        new Text(
                                          "Firman Allah SWT: 'Dan sempurnakanlah ibadat haji dan umrah kerana Allah.'",
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(
                                            fontSize: 10.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                        ),
                                        new Text(
                                          "(Surah al-Baqarah, ayat 196)",
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(
                                            fontSize: 10.0,
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Articles Preview
                  SizedBox(
                    height: 12.0,
                  ),
                  //articles
                  Container(
                    color: Colors.orange[100],
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Artikel Terbaru',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FutureBuilder(
                            future: fetchWpPosts(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Map wppost = snapshot.data[index];
                                    return PostTile(
                                        href: wppost["_links"]
                                            ["wp:featuredmedia"][0]["href"],
                                        title: wppost['title']['rendered']
                                            .replaceAll("&#8211; ", "")
                                            .replaceAll("1928", ""),
                                        desc: wppost['excerpt']['rendered'],
                                        content: wppost['content']['rendered']);
                                  },
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: SpinKitRing(
              color: Colors.purple,
            ),
          );
        }
      },
    );
  }
}
