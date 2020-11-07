import 'package:bomoco/account_tabs/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: 300,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.white,
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Avertissement",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              Text(
                "Vous devez disposer d'un compte pour accéder à cet espace",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, ),
              ),
              Padding(padding: EdgeInsets.only(top: 20, bottom: 10)),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "S'inscrire",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                color: Colors.orange,
                textColor: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, Login.routeName);
                  
                },
                child: Text(
                  "Se connecter",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                color: Colors.orange,
                textColor: Colors.white,
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}