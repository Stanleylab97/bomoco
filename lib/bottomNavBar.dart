import 'package:bomoco/BottomNavBar/home.dart';
import 'package:bomoco/BottomNavBar/partners.dart';
import 'package:bomoco/account_tabs/welcome.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Racine extends StatefulWidget {
  @override
  _RacineState createState() => _RacineState();
}

class _RacineState extends State<Racine> {


  int currentIndex = 1;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        Partners(),
        HomePage(),
        Welcome(),
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.orange,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(
                Icons.group,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.group,
                color: Colors.orange,
              ),
              title: Text("Partenaires")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black87,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon:
                  FaIcon(FontAwesomeIcons.newspaper, color: Colors.orange),
              title: Text("Actualité")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black87,
              icon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/user.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x5c000000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              activeIcon:
                 Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange,width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/user.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x5c000000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              title: Text("Compte")),
        ],
      ),
    );
  }
}
