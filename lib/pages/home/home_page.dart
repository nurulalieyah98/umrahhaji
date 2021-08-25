// // import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
// // import 'package:carousel_pro/carousel_pro.dart';
// // import 'package:flutter/material.dart';
// // import 'package:umrahhaji/otp/screen/user_profile2.dart';
// // import 'package:umrahhaji/pages/home/article_homepage/list_article_homepage.dart';
// // import 'package:umrahhaji/pages/home/article_homepage/wp-article-homepage.dart';
// // import 'package:umrahhaji/pages/home/product_homepage/list_product_homepage.dart';
// // import 'package:umrahhaji/pages/home/product_homepage/wp-product-homepage.dart';
// // import 'package:umrahhaji/pages/modul%20ebook/screen_ebook.dart';
// // import 'package:umrahhaji/pages/product/product.dart';
// // import 'package:umrahhaji/pages/soal_jawab/post_home.dart';
// // import 'package:umrahhaji/pages/soal_jawab/qna_option/qna_option.dart';
// // import 'package:umrahhaji/pages/umrahhaji_tv/list_screen.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   void changePage(int index) {
// //     setState(() {
// //       currentIndex = index;
// //     });
// //   }

// //   int currentIndex = 0;

// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       appBar: AppBar(
// //           centerTitle: true,
// //           title: Text("Laman Utama"),
// //           automaticallyImplyLeading: false),
// //       bottomNavigationBar: BubbleBottomBar(
// //           opacity: 0.2,
// //           backgroundColor: Colors.white,
// //           borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),
// //           currentIndex: currentIndex,
// //           hasInk: true,
// //           inkColor: Colors.black12,
// //           hasNotch: true,
// //           //fabLocation: BubbleBottomBarFabLocation.center,
// //           onTap: changePage,
// //           items: <BubbleBottomBarItem>[
// //             BubbleBottomBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(Icons.home, color: Colors.black),
// //               activeIcon: Icon(Icons.home, color: Colors.black),
// //               title: GestureDetector(
// //                   child: Text("Home"),
// //                   onTap: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => HomePage()));
// //                   }), //Route to HomePage
// //             ),
// //             BubbleBottomBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(Icons.article_rounded, color: Colors.black),
// //               activeIcon: Icon(Icons.article_rounded, color: Colors.black),
// //               title: GestureDetector(
// //                   child: Text("Articles"),
// //                   onTap: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => PostHome()));
// //                   }), //Route to Articles
// //             ),
// //             BubbleBottomBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(Icons.live_tv_rounded, color: Colors.black),
// //               activeIcon: Icon(Icons.live_tv_rounded, color: Colors.black),
// //               title: GestureDetector(
// //                   child: Text("TV"),
// //                   onTap: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => ListScreen()));
// //                   }), //Route to UmrahHaji TV
// //             ),
// //             BubbleBottomBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
// //               activeIcon:
// //                   Icon(Icons.shopping_cart_rounded, color: Colors.black),
// //               title: GestureDetector(
// //                   child: Text("Shop"),
// //                   onTap: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => ProductPage()));
// //                   }), //Route to Shop
// //             ),
// //             BubbleBottomBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(Icons.menu_book_rounded, color: Colors.black),
// //               activeIcon: Icon(Icons.menu_book_rounded, color: Colors.black),
// //               title: GestureDetector(
// //                   child: Text("Ebook"),
// //                   onTap: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => ScreenEbook()));
// //                   }), //Route to eBook
// //             ),
// //             BubbleBottomBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(Icons.account_circle_rounded, color: Colors.black),
// //               activeIcon:
// //                   Icon(Icons.account_circle_rounded, color: Colors.black),
// //               title: GestureDetector(
// //                   child: Text("Profile"),
// //                   onTap: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => UserProfile()));
// //                   }), //Route to Profile
// //             ),
// //           ]),
// //       //Now we are going to open a new file
// //       // where we will create the layout of the Drawer
// //       // drawer: Drawer(
// //       //   child: NavigationDrawer(),
// //       // ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             Image(
// //               image: AssetImage('assets/images/UH1.png'),
// //               width: 200.0,
// //               // height: 200.0,
// //               alignment: Alignment.center,
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             ///////////////////////////////////////// image slider /////////////////////////////////////////////
// //             Center(
// //               child: Container(
// //                 child: Padding(
// //                   //kalau taknak dia fit dekat phone, kena letak padding
// //                   padding: const EdgeInsets.all(10.0),
// //                   child: SizedBox(
// //                     height: 180.0,
// //                     width: 300.0,
// //                     child: Carousel(
// //                       autoplay: true,
// //                       autoplayDuration: Duration(milliseconds: 5000),
// //                       dotSize: 4.0,
// //                       dotSpacing: 15.0,
// //                       dotColor: Colors.orange,
// //                       indicatorBgPadding: 5.0,
// //                       dotBgColor: Colors.transparent,
// //                       dotVerticalPadding: 5.0,
// //                       animationCurve: Curves.fastOutSlowIn,
// //                       animationDuration: Duration(milliseconds: 2000),
// //                       images: [
// //                         Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/7.jpg', fit: BoxFit.cover),
// //                         Image.asset('assets/images/8.jpg', fit: BoxFit.cover),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),

// //             ///////////////////////////////////////// anugerah terindah menjadi tetamu Allah /////////////////////////////////////////////
// //             Container(
// //               color: Colors.orange,
// //               padding: new EdgeInsets.only(top: 16.0, bottom: 16.0),
// //               child: new Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Text(
// //                     'Anugerah terindah, menjadi tetamu Allah.',
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   Text(
// //                     'Impian setiap Muslim',
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     "Firman Allah SWT: 'Dan sempurnakanlah ibadat haji dan umrah kerana Allah.' (Surah al-Baqarah, ayat 196)",
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),

// //             ///////////////////////////////// kenapa pilih aplikasi umrahhaji ////////////////////////////////////////////
// //             Container(
// //               color: Colors.teal[100],
// //               padding: new EdgeInsets.only(top: 16.0, bottom: 16.0),
// //               child: new Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Image(image: AssetImage('assets/images/pasangan1.jpg')),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     'KENAPA PILIH APLIKASI UMRAHHAJI ?',
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     "Aplikasi ini menyediakan maklumat dan kupasan tentang amal ibadat yang berkaitan Umrah dan Haji.",
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   ElevatedButton.icon(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => QnAOption()),
// //                       );
// //                       // Respond to button press
// //                     },
// //                     icon: Icon(Icons.book, size: 18),
// //                     label: Text("Nota-Nota Berkaitan Umrah & Haji"),
// //                     style: ElevatedButton.styleFrom(
// //                       primary: Colors.teal,
// //                       onPrimary: Colors.white,
// //                       elevation: 5,
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),

// //             //////////////////////////////////////////////////////// article //////////////////////////////////////////////////
// //             Container(
// //               color: Colors.orange[100],
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     'Artikel Dan Soal Jawab',
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   FutureBuilder(
// //                     future: fetchWpPostsArticle(),
// //                     builder: (context, snapshot) {
// //                       if (snapshot.hasData) {
// //                         return GridView.builder(
// //                           gridDelegate:
// //                               SliverGridDelegateWithFixedCrossAxisCount(
// //                             crossAxisCount: 2,
// //                             childAspectRatio:
// //                                 MediaQuery.of(context).size.width /
// //                                     (MediaQuery.of(context).size.height / 1.5),
// //                           ),
// //                           // physics: ClampingScrollPhysics(),
// //                           // physics: NeverScrollableScrollPhysics(),
// //                           padding: EdgeInsets.all(3),
// //                           physics: ScrollPhysics(),
// //                           shrinkWrap: true,
// //                           itemCount: snapshot.data.length,
// //                           itemBuilder: (BuildContext context, int index) {
// //                             Map wppost = snapshot.data[index];

// //                             return PostTileArticle(
// //                               href: wppost["_links"]["wp:featuredmedia"][0]
// //                                   ["href"],
// //                               title: wppost["title"]["rendered"]
// //                                   .replaceAll("&#038;", "")
// //                                   .replaceAll("&#8217;", "'"),
// //                               desc: wppost["excerpt"]["rendered"],
// //                               content: wppost["content"]["rendered"],
// //                             );
// //                           },
// //                         );
// //                       }
// //                       return CircularProgressIndicator();
// //                     },
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       ElevatedButton.icon(
// //                         onPressed: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => QnAOption()),
// //                           );
// //                           // Respond to button press
// //                         },
// //                         icon: Icon(Icons.book, size: 18),
// //                         label: Text("Artikel"),
// //                         style: ElevatedButton.styleFrom(
// //                           primary: Colors.orange,
// //                           onPrimary: Colors.white,
// //                           elevation: 5,
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       ElevatedButton.icon(
// //                         onPressed: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => QnAOption()),
// //                           );
// //                           // Respond to button press
// //                         },
// //                         icon: Icon(Icons.book, size: 18),
// //                         label: Text("Soal Jawab"),
// //                         style: ElevatedButton.styleFrom(
// //                           primary: Colors.orange,
// //                           onPrimary: Colors.white,
// //                           elevation: 5,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   SizedBox(
// //                     height: 20.0,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),

// //             //////////////////////////////////////////////////////// product //////////////////////////////////////////////////
// //             Container(
// //               color: Colors.teal[100],
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     'Kemudahan Lain',
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     "Kami juga menyediakan khidmat menjual barangan keperluan haji dan umrah.",
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 15.0,
// //                       fontStyle: FontStyle.italic,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   FutureBuilder(
// //                     future: fetchWpPostsProduct(),
// //                     builder: (context, snapshot) {
// //                       if (snapshot.hasData) {
// //                         return GridView.builder(
// //                           gridDelegate:
// //                               SliverGridDelegateWithFixedCrossAxisCount(
// //                             crossAxisCount: 2,
// //                             childAspectRatio:
// //                                 MediaQuery.of(context).size.width /
// //                                     (MediaQuery.of(context).size.height / 1.75),
// //                           ),
// //                           // physics: ClampingScrollPhysics(),
// //                           // physics: NeverScrollableScrollPhysics(),
// //                           padding: EdgeInsets.all(3),
// //                           physics: ScrollPhysics(),
// //                           shrinkWrap: true,
// //                           itemCount: snapshot.data.length,
// //                           itemBuilder: (BuildContext context, int index) {
// //                             Map wppost = snapshot.data[index];

// //                             return PostTileProduct(
// //                               href: wppost["_links"]["wp:featuredmedia"][0]
// //                                   ["href"],
// //                               title: wppost["title"]["rendered"]
// //                                   .replaceAll("&#038;", "")
// //                                   .replaceAll("&#8217;", "'"),
// //                               desc: wppost["excerpt"]["rendered"],
// //                               content: wppost["content"]["rendered"],
// //                               link: wppost["link"],
// //                             );
// //                           },
// //                         );
// //                       }
// //                       return CircularProgressIndicator();
// //                     },
// //                   ),
// //                   ElevatedButton.icon(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => ProductPage()),
// //                       );
// //                       // Respond to button press
// //                     },
// //                     icon: Icon(Icons.book, size: 18),
// //                     label: Text("Lihat Semua Produk"),
// //                     style: ElevatedButton.styleFrom(
// //                       primary: Colors.teal,
// //                       onPrimary: Colors.white,
// //                       elevation: 5,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.0,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //             //////////////////////////////////////////////////////// footer //////////////////////////////////////////////////
// //             Container(
// //               child: Column(
// //                 children: [
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Image(
// //                     image: AssetImage('assets/images/UH1.png'),
// //                     width: 200.0,
// //                     // height: 200.0,
// //                     alignment: Alignment.center,
// //                   ),
// //                   Text(
// //                     'Platfrom inisiatif untuk membantu para bakal jemaah haji dan umrah yang dibangunkan oleh Akram Afifi Holdings Sdn Bhd.',
// //                     style: new TextStyle(
// //                       fontSize: 13.0,
// //                       fontWeight: FontWeight.normal,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                   SizedBox(
// //                     height: 10.0,
// //                   ),
// //                   Text(
// //                     "Ikuti kami di media sosial yang tertera di bawah.",
// //                     textAlign: TextAlign.center,
// //                     style: new TextStyle(
// //                       fontSize: 13.0,
// //                       fontStyle: FontStyle.normal,
// //                       fontWeight: FontWeight.bold,
// //                       fontFamily: 'Roboto',
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.0,
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       GestureDetector(
// //                         onTap: () => launch(
// //                             'https://www.instagram.com/umrahhajiofficial/'),
// //                         child: Image(
// //                           image: AssetImage('assets/images/instagram.png'),
// //                           width: 50.0,
// //                           height: 50.0,
// //                           alignment: Alignment.center,
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       GestureDetector(
// //                         onTap: () => launch(
// //                             'https://www.youtube.com/channel/UCxjk8D7kVP7nIyhkadPl-zA'),
// //                         child: Image(
// //                           image: AssetImage('assets/images/youtube.png'),
// //                           width: 50.0,
// //                           height: 50.0,
// //                           alignment: Alignment.center,
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       GestureDetector(
// //                         onTap: () => launch(
// //                             'https://www.facebook.com/umrahhajiofficial/'),
// //                         child: Image(
// //                           image: AssetImage('assets/images/facebook.png'),
// //                           width: 50.0,
// //                           height: 50.0,
// //                           alignment: Alignment.center,
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       GestureDetector(
// //                         onTap: () => launch('https://t.me/NotaUmrahHaji'),
// //                         child: Image(
// //                           image: AssetImage('assets/images/telegram.png'),
// //                           width: 50.0,
// //                           height: 50.0,
// //                           alignment: Alignment.center,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   SizedBox(
// //                     height: 20.0,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20.0,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/home/article_homepage/list_article_homepage.dart';
import 'package:umrahhaji/pages/home/article_homepage/wp-article-homepage.dart';
import 'package:umrahhaji/pages/modul%20ebook/screen_ebook.dart';
import 'package:umrahhaji/pages/product/product.dart';
import 'package:umrahhaji/pages/profile/testing/testing_home.dart';
import 'package:umrahhaji/pages/profile/testing/testing_profile.dart';
import 'package:umrahhaji/pages/soal_jawab/post_home.dart';
import 'package:umrahhaji/pages/umrahhaji_tv/list_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }), //Route to HomePage
              title: GestureDetector(
                  child: Text("Home"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }), //Route to HomePage
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.article_rounded, color: Colors.black),
              activeIcon: GestureDetector(
                  child: Icon(Icons.article_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostHome()));
                  }),
              title: GestureDetector(
                  child: Text("Articles"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostHome()));
                  }), //Route to Articles
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.live_tv_rounded, color: Colors.black),
              activeIcon: GestureDetector(
                  child: Icon(Icons.live_tv_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListScreen()));
                  }),
              title: GestureDetector(
                  child: Text("TV"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListScreen()));
                  }), //Route to UmrahHaji TV
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
              activeIcon: GestureDetector(
                  child: Icon(Icons.shopping_cart_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                  }),
              title: GestureDetector(
                  child: Text("Shop"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                  }), //Route to Shop
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.menu_book_rounded, color: Colors.black),
              activeIcon: GestureDetector(
                  child: Icon(Icons.menu_book_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenEbook()));
                  }),
              title: GestureDetector(
                  child: Text("Ebook"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenEbook()));
                  }), //Route to eBook
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.account_circle_rounded, color: Colors.black),
              activeIcon: GestureDetector(
                  child:
                      Icon(Icons.account_circle_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  }),
              title: GestureDetector(
                  child: Text("Profile"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  }), //Route to Profile
            ),
          ]),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Image.asset("assets/images/umrahhajilogo.png"))),
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
                      image: AssetImage('assets/images/orange-kerawang.jpg'),
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
                            itemBuilder: (BuildContext context, int index) {
                              Map wppost = snapshot.data[index];
                              return PostTile(
                                  href: wppost["_links"]["wp:featuredmedia"][0]
                                      ["href"],
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
  }
}

// import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:umrahhaji/pages/home/article_homepage/list_article_homepage.dart';
// import 'package:umrahhaji/pages/home/article_homepage/wp-article-homepage.dart';
// import 'package:umrahhaji/pages/modul%20ebook/screen_ebook.dart';
// import 'package:umrahhaji/pages/product/product.dart';
// import 'package:umrahhaji/pages/soal_jawab/post_home.dart';
// import 'package:umrahhaji/pages/umrahhaji_tv/list_screen.dart';
// import 'package:umrahhaji/user_profile.dart';

// class HomePage extends StatefulWidget {
//   // const HomePage({ Key? key }) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentIndex = 0;

//   // void initState() {
//   //   super.initState();
//   //   currentIndex = 0;
//   // }

//   void changePage(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   //pages for each tab
//   // List<Widget> pages = [
//   //   HomePage(),
//   //   PostHome(),
//   //   HomePage(),
//   //   HomePage(),
//   //   HomePage(),
//   //   HomePage(),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightGreen[50],
//       //Bottom Navigation Bar
//       bottomNavigationBar: BubbleBottomBar(
//           opacity: 0.2,
//           backgroundColor: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(3.0)),
//           currentIndex: currentIndex,
//           hasInk: true,
//           inkColor: Colors.black12,
//           hasNotch: true,
//           //fabLocation: BubbleBottomBarFabLocation.center,
//           onTap: changePage,
//           items: <BubbleBottomBarItem>[
//             BubbleBottomBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.home, color: Colors.black),
//               activeIcon: GestureDetector(
//                   child: Icon(Icons.home, color: Colors.black),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => HomePage()));
//                   }), //Route to HomePage
//               title: GestureDetector(
//                   child: Text("Home"),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => HomePage()));
//                   }), //Route to HomePage
//             ),
//             BubbleBottomBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.article_rounded, color: Colors.black),
//               activeIcon: GestureDetector(
//                   child: Icon(Icons.article_rounded, color: Colors.black),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => PostHome()));
//                   }),
//               title: GestureDetector(
//                   child: Text("Articles"),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => PostHome()));
//                   }), //Route to Articles
//             ),
//             BubbleBottomBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.live_tv_rounded, color: Colors.black),
//               activeIcon: GestureDetector(
//                   child: Icon(Icons.live_tv_rounded, color: Colors.black),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ListScreen()));
//                   }),
//               title: GestureDetector(
//                   child: Text("TV"),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ListScreen()));
//                   }), //Route to UmrahHaji TV
//             ),
//             BubbleBottomBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.shopping_cart_rounded, color: Colors.black),
//               activeIcon: GestureDetector(
//                   child: Icon(Icons.shopping_cart_rounded, color: Colors.black),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ProductPage()));
//                   }),
//               title: GestureDetector(
//                   child: Text("Shop"),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ProductPage()));
//                   }), //Route to Shop
//             ),
//             BubbleBottomBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.menu_book_rounded, color: Colors.black),
//               activeIcon: GestureDetector(
//                   child: Icon(Icons.menu_book_rounded, color: Colors.black),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ScreenEbook()));
//                   }),
//               title: GestureDetector(
//                   child: Text("Ebook"),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => ScreenEbook()));
//                   }), //Route to eBook
//             ),
//             BubbleBottomBarItem(
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.account_circle_rounded, color: Colors.black),
//               activeIcon: GestureDetector(
//                   child:
//                       Icon(Icons.account_circle_rounded, color: Colors.black),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => UserProfile()));
//                   }),
//               title: GestureDetector(
//                   child: Text("Profile"),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => UserProfile()));
//                   }), //Route to Profile
//             ),
//           ]),
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//             Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                     child: Image.asset("assets/images/umrahhajilogo.png"))),
//             //Image Slider on top
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 180.0,
//                 enlargeCenterPage: true,
//                 autoPlay: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enableInfiniteScroll: true,
//                 autoPlayAnimationDuration: Duration(milliseconds: 500),
//                 viewportFraction: 1,
//               ),
//               items: [
//                 Container(
//                   margin: EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/imageslider1.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/imageslider2.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/imageslider3.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/imageslider4.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/imageslider5.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/imageslider6.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             //Quote
//             SingleChildScrollView(
//               child: Container(
//                 alignment: Alignment.center,
//                 height: 70,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       alignment: Alignment.center,
//                       image: AssetImage('assets/images/orange-kerawang.jpg'),
//                       fit: BoxFit.cover),
//                 ),
//                 child: new Column(
//                   children: <Widget>[
//                     Container(
//                       child: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           new SizedBox(
//                             height: 3.0,
//                           ),
//                           Center(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Anugerah terindah, menjadi tetamu Allah.',
//                                   textAlign: TextAlign.center,
//                                   style: new TextStyle(
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Roboto',
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Impian setiap Muslim',
//                                   textAlign: TextAlign.center,
//                                   style: new TextStyle(
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Roboto',
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Center(
//                               child: Column(
//                                 children: [
//                                   new Text(
//                                     "Firman Allah SWT: 'Dan sempurnakanlah ibadat haji dan umrah kerana Allah.'",
//                                     textAlign: TextAlign.center,
//                                     style: new TextStyle(
//                                       fontSize: 10.0,
//                                       fontStyle: FontStyle.italic,
//                                       fontFamily: 'Roboto',
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   new Text(
//                                     "(Surah al-Baqarah, ayat 196)",
//                                     textAlign: TextAlign.center,
//                                     style: new TextStyle(
//                                       fontSize: 10.0,
//                                       fontStyle: FontStyle.italic,
//                                       fontFamily: 'Roboto',
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             //Articles Preview
//             SizedBox(
//               height: 12.0,
//             ),
//             //articles
//             Container(
//               color: Colors.orange[100],
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Text(
//                       'Artikel Terbaru',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     FutureBuilder(
//                       future: fetchWpPosts(),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return ListView.builder(
//                             physics: ClampingScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: snapshot.data.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               Map wppost = snapshot.data[index];
//                               return PostTile(
//                                   href: wppost["_links"]["wp:featuredmedia"][0]
//                                       ["href"],
//                                   title: wppost['title']['rendered']
//                                       .replaceAll("&#8211; ", "")
//                                       .replaceAll("1928", ""),
//                                   desc: wppost['excerpt']['rendered'],
//                                   content: wppost['content']['rendered']);
//                             },
//                           );
//                         }
//                         return Center(child: CircularProgressIndicator());
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
