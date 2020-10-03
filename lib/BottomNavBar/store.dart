import 'package:bomoco/account_tabs/profile.dart';
import 'package:bomoco/store_tabs/biens.dart';
import 'package:bomoco/store_tabs/paiement.dart';
import 'package:bomoco/store_tabs/panier.dart';
import 'package:bomoco/store_tabs/services.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
                  } */
            });
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'Biens',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Services',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Panier',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Paiement',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Biens(),//ff5722
              Services(),//3f51b5
              Panier(),//e91e63
              Paiement(), //9c27b0
            ],
          )),
    );
  }
}