// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/material.dart';
// import 'package:umrahhaji/widget/navigation_drawer_widget.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Umrah Haji"),
//       ),
//       //Now we are going to open a new file
//       // where we will create the layout of the Drawer
//       drawer: Drawer(
//         child: NavigationDrawer(),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 200.0,
//             width: double.infinity,
//             child: Carousel(
//               autoplay: true,
//               animationCurve: Curves.ease,
//               dotSize: 4.0,
//               dotSpacing: 15.0,
//               dotColor: Colors.greenAccent,
//               indicatorBgPadding: 5.0,
//               dotBgColor: Colors.transparent,
//               dotVerticalPadding: 5.0,
//               animationDuration: Duration(milliseconds: 5000),
//               images: [
//                 Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/7.jpg', fit: BoxFit.cover),
//                 Image.asset('assets/images/8.jpg', fit: BoxFit.cover),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah_haji/list_qna_umrah_haji.dart';
import 'package:umrahhaji/widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laman Utama"),
      ),
      //Now we are going to open a new file
      // where we will create the layout of the Drawer
      drawer: Drawer(
        child: NavigationDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Image(
              image: AssetImage('assets/images/UH1.png'),
              width: 200.0,
              // height: 200.0,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            //untuk image slider
            Center(
              child: Container(
                child: Padding(
                  //kalau taknak dia fit dekat phone, kena letak padding
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 180.0,
                    width: 300.0,
                    child: Carousel(
                      autoplay: true,
                      autoplayDuration: Duration(milliseconds: 5000),
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: Colors.orange,
                      indicatorBgPadding: 5.0,
                      dotBgColor: Colors.transparent,
                      dotVerticalPadding: 5.0,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 2000),
                      images: [
                        Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/7.jpg', fit: BoxFit.cover),
                        Image.asset('assets/images/8.jpg', fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //anugerah terindah menjadi tetamu Allah
            Container(
              color: Colors.orange,
              padding: new EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Anugerah terindah, menjadi tetamu Allah.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Impian setiap Muslim',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Firman Allah SWT: 'Dan sempurnakanlah ibadat haji dan umrah kerana Allah.' (Surah al-Baqarah, ayat 196)",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //kenapa pilih aplikasi umrahhaji
            Container(
              color: Colors.teal[100],
              padding: new EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage('assets/images/pasangan1.jpg')),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'KENAPA PILIH APLIKASI UMRAHHAJI ?',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Aplikasi ini menyediakan maklumat dan kupasan tentang amal ibadat yang berkaitan Umrah dan Haji.",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QnAUmrahHaji()),
                      );
                      // Respond to button press
                    },
                    icon: Icon(Icons.book, size: 18),
                    label: Text("Nota-Nota Berkaitan Umrah & Haji"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      elevation: 5,
                    ),
                  )
                ],
              ),
            ),
            // Divider(
            //   thickness: 3.0,
            // ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Umrah Haji Artikel',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            // Container(
            //   height: 200.0,
            //   child: FutureBuilder(
            //     future: fetchWpPosts(),
            //     // ignore: missing_return
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //             scrollDirection: Axis.vertical,
            //             shrinkWrap: true,
            //             itemCount: snapshot.data.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               Map wppost = snapshot.data[index];
            //               return Text(wppost['title']['rendered']);
            //             });
            //       } else {}
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
          ],
        ),
      ),
    );
  }
}
