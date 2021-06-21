import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_haji/list_qna_haji.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_qurban/list_qna_qurban.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_ramadhan/no_post.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah/list_qna_umrah.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah_haji/list_qna_umrah_haji.dart';

class QnAOption extends StatefulWidget {
  @override
  _QnAOptionState createState() => _QnAOptionState();
}

class _QnAOptionState extends State<QnAOption> {
  String _selectedArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soal Jawab Umrah Haji'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButton(
              value: _selectedArticle,
              items: _dropDownItem(),
              onChanged: (value) {
                _selectedArticle = value;
                switch (value) {
                  case "Q&A Fiqh Umrah":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QnAUmrah()),
                    );
                    break;
                  case "Q&A Fiqh Haji":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QnAHaji()),
                    );
                    break;
                  case "Q&A Fiqh Umrah Haji":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QnAUmrahHaji()),
                    );
                    break;
                  case "Q&A Fiqh Qurban":
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QnAQurban()),
                    );
                    break;
                  case "Q&A Fiqh Ramadhan":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoPostQnARamadhan()),
                    );
                    break;
                }
              },
              hint: Text('Pilih Jenis Soal Jawab'),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "Q&A Fiqh Umrah",
      "Q&A Fiqh Haji",
      "Q&A Fiqh Umrah Haji",
      "Q&A Fiqh Qurban",
      "Q&A Fiqh Ramadhan"
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}
