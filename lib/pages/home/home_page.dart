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
import 'package:umrahhaji/widget/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Umrah Haji"),
      ),
      //Now we are going to open a new file
      // where we will create the layout of the Drawer
      drawer: Drawer(
        child: NavigationDrawer(),
      ),
      body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Padding(
            //kalau taknak dia fit dekat phone, kena letak padding
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 200.0,
              width: double.infinity,
              child: Carousel(
                autoplay: true,
                autoplayDuration: Duration(milliseconds: 5000),
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.greenAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,
                dotVerticalPadding: 5.0,
                animationDuration: Duration(milliseconds: 1000),
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
          )),
    );
  }
}
