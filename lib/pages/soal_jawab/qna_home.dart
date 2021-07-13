import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_haji/list_qna_haji.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_qurban/list_qna_qurban.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_ramadhan/no_post.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah/list_qna_umrah.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah_haji/testing.dart';

// ignore: must_be_immutable
class ArticleHome extends StatefulWidget {
  ArticleHome(this.colorVal);
  int colorVal;

  @override
  _ArticleHomeState createState() => _ArticleHomeState();
}

class _ArticleHomeState extends State<ArticleHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override

//set colour when tap the tap bar
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      setState(() {
        widget.colorVal = 0xff000000;
      });
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(77.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orange[200],
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 3.0,
              indicatorColor: Color(0xffffffff),
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.newspaper,
                    color: _tabController.index == 0
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Fiqh Umrah',
                      style: TextStyle(
                          color: _tabController.index == 0
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.infoCircle,
                    color: _tabController.index == 1
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Fiqh Haji',
                      style: TextStyle(
                          color: _tabController.index == 1
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.kaaba,
                    color: _tabController.index == 2
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Fiqh Umrah Haji',
                      style: TextStyle(
                          color: _tabController.index == 2
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.paw,
                    color: _tabController.index == 3
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Fiqh Qurban',
                      style: TextStyle(
                          color: _tabController.index == 3
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.moon,
                    color: _tabController.index == 4
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Fiqh Ramadhan',
                      style: TextStyle(
                          color: _tabController.index == 4
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          QnAUmrah(),
          QnAHaji(),
          QnAUmrahHaji(),
          QnAQurban(),
          NoPostQnARamadhan(),
        ]),
      ),
    );
  }
}
