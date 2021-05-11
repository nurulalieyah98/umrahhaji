import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/home/home_page.dart';
import 'package:umrahhaji/pages/favourite_page.dart';
import 'package:umrahhaji/pages/modul%20ebook/ebook2.dart';
import 'package:umrahhaji/widget/drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        HeaderDrawer(),
        SizedBox(
          height: 10.0,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text("Utama"),
        ),
        ExpansionTile(
          // onTap: () {},
          leading: Icon(
            Icons.article,
            color: Colors.black,
          ),
          title: Text("Artikel"),
          children: <Widget>[
            // Text("children 1"),
            // Text("children 2"),
            ListTile(
              leading: Icon(Icons.article, color: Colors.transparent),
              onTap: () {},
              title: Text("Berita Haramain"),
            ),
            ListTile(
              leading: Icon(
                Icons.article,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Info Haramain"),
            ),
            ListTile(
              leading: Icon(
                Icons.article,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Sirah & Sejarah Mekah Madinah"),
            ),
            ListTile(
              leading: Icon(
                Icons.article,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Tips & Trick Umrah Haji"),
            ),
            ListTile(
              leading: Icon(
                Icons.article,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Travelog"),
            ),
          ],
        ),
        ExpansionTile(
          // onTap: () {},
          leading: Icon(
            Icons.question_answer,
            color: Colors.black,
          ),
          title: Text("Soal Jawab Umrah Haji"),
          children: <Widget>[
            // Text("children 1"),
            // Text("children 2"),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Q&A Fiqh Umrah"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Q&A Fiqh Haji"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Q&A Fiqh Qurban"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {},
              title: Text("Q&A Fiqh Ramadhan"),
            ),
          ],
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.video_collection,
            color: Colors.black,
          ),
          title: Text("UmrahHaji TV"),
        ),
        ExpansionTile(
            // onTap: () {},
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            title: Text("Kelengkapan Umrah & Haji"),
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.transparent,
                ),
                onTap: () {},
                title: Text("Senarai Produk"),
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.transparent,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => FavouritesPage()),
                  // );
                },
                title: Text("Troli"),
              ),
            ]),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ebook()),
            );
          },
          leading: Icon(
            Icons.cloud_download,
            color: Colors.black,
          ),
          title: Text("Modul eBook"),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.phone,
            color: Colors.black,
          ),
          title: Text("Hubungi"),
        ),
        ListTile(
          onTap: () {
            //testing je
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavouritesPage()),
            );
          },
          leading: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          title: Text("Log Keluar"),
        ),
      ]),
    );
  }
}
