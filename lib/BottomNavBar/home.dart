import 'package:bomoco/home_tabs/events.dart';
import 'package:bomoco/home_tabs/news.dart';
import 'package:bomoco/home_tabs/tv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  ScrollController _scrollController;
  TabController _tabController;
  int currentIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> categoriesActu = [
    "Actualités",
    "Donations",
    "Demandes",
    "Evenements",
    "Opportunités",
    "Chaine Vidéo"
  ];

  List<Widget> tabChildren = [
    News(),
  Center(child:Padding(padding: EdgeInsets.all(10.0),child: Text("Vous devez vous abonner pour consulter les donations",textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),))),
  Placeholder(),
  Events(),
  Placeholder(),
  Tele()];
   
   
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: categoriesActu.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 35, 25, 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bomoco! A l'affus de l'information",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Times",
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: EdgeInsets.only(right: 15),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    isScrollable: true,
                    indicator: UnderlineTabIndicator(),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        fontFamily: "Avenir",
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: Colors.black45,
                    unselectedLabelStyle: TextStyle(
                        fontFamily: "Avenir",
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    tabs: List.generate(categoriesActu.length,
                        (index) => Text(categoriesActu[index]))),
              ),
            ),
          ];
        },
        body: Container(
          child: TabBarView(
              controller: _tabController,
              children: List.generate(tabChildren.length, (index) {
                return tabChildren[index];
              })),
        ));
  }
}
