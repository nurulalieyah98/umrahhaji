import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/pages/artikel/berita-haramain/berita-list.dart';
import 'package:umrahhaji/pages/artikel/info-haramain/info-list.dart';
import 'package:umrahhaji/pages/artikel/sirah/sirah-list.dart';
import 'package:umrahhaji/pages/artikel/tips/tips-list.dart';
import 'package:umrahhaji/pages/artikel/travelog/travelog-list.dart';

// ignore: must_be_immutable
class ArticleHome extends StatefulWidget {
  // const ArticleHome({ Key? key }) : super(key: key);

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
              //unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.newspaper,
                    color: _tabController.index == 0
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Berita Haramain',
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
                  child: Text('Info Haramain',
                      style: TextStyle(
                          color: _tabController.index == 1
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.history,
                    color: _tabController.index == 2
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Sirah',
                      style: TextStyle(
                          color: _tabController.index == 2
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.lightbulb,
                    color: _tabController.index == 3
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Tips & Tricks',
                      style: TextStyle(
                          color: _tabController.index == 3
                              ? Color(widget.colorVal)
                              : Colors.grey,
                          fontSize: 10)),
                ),
                Tab(
                  icon: Icon(
                    FontAwesomeIcons.kaaba,
                    color: _tabController.index == 4
                        ? Color(widget.colorVal)
                        : Colors.grey,
                    size: 20,
                  ),
                  child: Text('Travelog',
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
          BeritaList(),
          InfoList(),
          SirahList(),
          TipsList(),
          TravelogList(),
        ]),
      ),
    );
  }
}
