import 'package:bomoco/home_tabs/announce.dart';
import 'package:bomoco/home_tabs/events.dart';
import 'package:bomoco/home_tabs/news.dart';
import 'package:bomoco/home_tabs/tv.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

Color PrimaryColor =  Colors.orange;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
           // backgroundColor: Color(0xff109618),
            backgroundColor: PrimaryColor,
            centerTitle: true,
            title: Text("Bomoco"),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: (){})
              ],
            bottom: TabBar(
              
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 3.0, 
               onTap: (index){
                 setState(() {
                  switch (index) {
                    case 0:
                      PrimaryColor= Colors.orange;
                      break;
                      case 1:
                      PrimaryColor= Color(0xff3f51b5);
                      break;
                      case 2:
                      PrimaryColor= Color(0xffe91e63);
                      break;
                      case 3:
                      PrimaryColor= Color(0xff9c27b0);
                      break;
              
                    default:
                  }
            });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'Actualité',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Annonces',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Evenements',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Télévisions',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              News(),//ff5722
              Annonce(),//3f51b5
              Events(),//e91e63
              Tele(), //9c27b0
            ],
          )),
    );
  }
}

Widget _GooglePlayAppBar() {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.bars), onPressed: () {  },
          ),
        ),
        Container(
          child: Text(
            'Google Play',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          child: IconButton(
              icon: Icon(
                FontAwesomeIcons.microphone,
                color: Colors.blueGrey,
              ),
              onPressed: null),
        ),
      ],
    ),
  );
}