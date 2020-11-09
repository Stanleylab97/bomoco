import 'package:bomoco/config/constants.dart';
import 'package:bomoco/config/shared.dart';
import 'package:bomoco/home_tabs/announce.dart';
import 'package:bomoco/home_tabs/events.dart';
import 'package:bomoco/home_tabs/news.dart';
import 'package:bomoco/home_tabs/read_news_view.dart';
import 'package:bomoco/home_tabs/tv.dart';
import 'package:bomoco/models/article.dart';
import 'package:bomoco/widgets/primary_card.dart';
import 'package:bomoco/widgets/secondary_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class HomePage extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

Color PrimaryColor = Colors.orange;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 150);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[menu(context), dashboard(context)],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Actualité",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 50),
                Text("Donations",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 50),
                Text("Demandes",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 50),
                Text("Evenements",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 50),
                Text("Chaine vidéo",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenWidth,
        child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
                animationDuration: duration,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                elevation: 8,
                color: Colors.white,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    child: Container(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 48),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    child: FaIcon(FontAwesomeIcons.bars,
                                        color: Colors.black),
                                    onTap: () {
                                      setState(() {
                                        if (isCollapsed)
                                          _controller.forward();
                                        else
                                          _controller.reverse();

                                        isCollapsed = !isCollapsed;
                                      });
                                    },
                                  ),
                                  Text("Actualité",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black)),
                                  Icon(Icons.settings, color: Colors.black),
                                ],
                              ),
                              SizedBox(height: 2),
                              ListView(children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .36,
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: ListView.builder(
                                    itemCount: popularList.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var news = popularList[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReadNewsView(news: news),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 12.0),
                                          child: PrimaryCard(news: news),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ]),
                              Column(children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .015),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 19.0),
                                    child: Text("Informations récentes",
                                        style: kNonActiveTabStyle),
                                  ),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        .35,
                                    child: StreamBuilder<QuerySnapshot>(
                                        stream: widget.firestore
                                            .collection("informations")
                                            .doc("various")
                                            .collection("news")
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            print(snapshot.data);
                                            return ListView.builder(
                                              itemCount:
                                                  snapshot.data.docs.length,
                                              itemBuilder: (context, index) {
                                                DocumentSnapshot info =
                                                    snapshot.data.docs[index];
                                                print(info);
                                                var recent = Article(
                                                    author: info['author'],
                                                    content: info['content'],
                                                    category: info['category'],
                                                    publishedAt:
                                                        Shared.readTimestamp(
                                                            info[
                                                                'publishedAt']),
                                                    image: info['image'],
                                                    seen: NumberFormat.compact()
                                                        .format(info['seen'])
                                                        .toString(),
                                                    subtitle: info['subtitle'],
                                                    title: info['title']);

                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReadNewsView(
                                                                news: recent),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.16,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18.0,
                                                            vertical: 8.0),
                                                    child: SecondaryCard(
                                                        news: recent),
                                                  ),
                                                );
                                              },
                                              padding: EdgeInsets.only(
                                                  top: 20.0, bottom: 10.0),
                                            );
                                          } else {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                        })),
                              ])
                            ]))))));
  }
}
/*            ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                var recent = popularList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadNewsView(news: recent),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 135.0,
                    margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                    child: SecondaryCard(news: recent),
                  ),
                );
              },
            )  */
