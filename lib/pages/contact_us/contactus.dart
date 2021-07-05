import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/contact_us/launch.dart';

class ContactUs extends StatefulWidget {
  // const ContactUs({ Key? key }) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // void launchWhatsapp({@required number, @required message}) async {
  //   String url = "https://api.whatsapp.com/send?phone=$number&text=$message";

  //   await canLaunch(url) ? launch(url) : print("Cannot open Whatsapp");
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hubungi Kami'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(130.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    LaunchUrl.launchWhatsapp(
                        phone: "+60136762670",
                        message: "Testing whatsapp contact us");
                  },
                  child: Text("Open Whatsapp"),
                ),
                ElevatedButton(
                  onPressed: () {
                    LaunchUrl.openEmail(
                        toEmail: "umrahhaji.com@gmail.com",
                        subject: "Hubungi Kami",
                        body: "Enquiry:");
                  },
                  child: Text("Send Email"),
                ),
                ElevatedButton(
                  onPressed: () {
                    LaunchUrl.launchUniversalLinkIos(
                        url: "https://www.facebook.com/umrahhajiofficial/");
                  },
                  child: Text("UmrahHaji Facebook"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
