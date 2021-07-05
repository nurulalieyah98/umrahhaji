import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/contact_us/contactus.dart';
import 'package:umrahhaji/pages/home/home_page.dart';
import 'package:umrahhaji/pages/modul%20ebook/ebook3.dart';
import 'package:umrahhaji/pages/product/list_product.dart';
import 'package:umrahhaji/pages/product/product.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_haji/list_qna_haji.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_qurban/list_qna_qurban.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_ramadhan/no_post.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah/list_qna_umrah.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah_haji/list_qna_umrah_haji.dart';
import 'package:umrahhaji/pages/umrahhaji_tv/list_screen.dart';
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QnAUmrah()),
                );
              },
              title: Text("Q&A Fiqh Umrah"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QnAHaji()),
                );
              },
              title: Text("Q&A Fiqh Haji"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QnAUmrahHaji()),
                );
              },
              title: Text("Q&A Fiqh Umrah Haji"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QnAQurban()),
                );
              },
              title: Text("Q&A Fiqh Qurban"),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.transparent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoPostQnARamadhan()),
                );
              },
              title: Text("Q&A Fiqh Ramadhan"),
            ),
          ],
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListScreen()),
            );
          },
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                },
                title: Text("Senarai Produk"),
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.shopping_cart,
              //     color: Colors.transparent,
              //   ),
              //   onTap: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => FavouritesPage()),
              //     // );
              //   },
              //   title: Text("Troli"),
              // ),
            ]),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ebook3()),
            );
          },
          leading: Icon(
            Icons.cloud_download,
            color: Colors.black,
          ),
          title: Text("Modul eBook"),
        ),
        ListTile(
          //testing je
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactUs()),
            );
          },
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
              MaterialPageRoute(builder: (context) => ListProduct()),
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
