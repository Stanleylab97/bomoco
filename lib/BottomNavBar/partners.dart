import 'package:bomoco/partnership_tabs/contributeurs.dart';
import 'package:bomoco/partnership_tabs/donateurs.dart';
import 'package:bomoco/partnership_tabs/operateurs.dart';
import 'package:bomoco/partnership_tabs/temoignages.dart';
import 'package:flutter/material.dart';

class Partners extends StatefulWidget {
  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
           // backgroundColor: Color(0xff109618),
            backgroundColor: Colors.orange,
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
                  /* switch (index) {
                    case 0:
                      PrimaryColor= Color(0xffff5722);
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
                  }*/
            });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'Operateurs',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Contributeurs',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Donateurs',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Temoignages',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Operateurs(),//ff5722
              Contributeurs(),//3f51b5
              Donateurs(),//e91e63
              Temoignages(), //9c27b0
            ],
          )),
    );
  }
}