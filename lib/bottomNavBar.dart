import 'package:bomoco/BottomNavBar/account.dart';
import 'package:bomoco/BottomNavBar/home.dart';
import 'package:bomoco/BottomNavBar/partners.dart';
import 'package:bomoco/models/operation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'BottomNavBar/store.dart';

class Racine extends StatefulWidget {
  @override
  _RacineState createState() => _RacineState();
}

class _RacineState extends State<Racine> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(), Account(), Partners(), Store()];
  
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.orange,
            ),
            title: new Text('Accueil', style: TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person, color: Colors.orange),
            title: new Text('Compte', style: TextStyle(color: Colors.orange)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Colors.orange),
              title:
                  Text('Partenaires', style: TextStyle(color: Colors.orange))),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.orange),
              title: Text('Boutique', style: TextStyle(color: Colors.orange)))
        ],
      ),
    );
  }
}
