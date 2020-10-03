
import 'package:bomoco/account_tabs/abonnement.dart';
import 'package:bomoco/account_tabs/messages.dart';
import 'package:bomoco/account_tabs/operations.dart';
import 'package:bomoco/account_tabs/profile.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
          
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
                 setState(() {});
              },
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      'Profil',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Abonnement',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Messages',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      'Opérations',
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Profile(),//ff5722
              Abonnement(),//3f51b5
              Messages(),//e91e63
              Operations(), //9c27b0
            ],
          )),
    );
  }
}