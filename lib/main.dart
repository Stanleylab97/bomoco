import 'package:bomoco/account_tabs/login.dart';
import 'package:bomoco/bottomNavBar.dart';
import 'package:bomoco/home_tabs/more/affaire_details.dart';
import 'package:bomoco/home_tabs/more/emploi_details.dart';
import 'package:bomoco/home_tabs/more/news_details.dart';
import 'package:bomoco/home_tabs/more/opportunity_details.dart';
import 'package:bomoco/store_tabs/more/bien_details.dart';
import 'package:bomoco/store_tabs/more/service_details.dart';
import 'package:flutter/material.dart';

import 'BottomNavBar/home.dart';
import 'account_tabs/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        Login.routeName: (context)=>Login(),
        Register.routeName:(context)=>Register(),
        NewsDetails.routeName:(context)=>NewsDetails(),
        AffaireDetails.routeName:(context)=>AffaireDetails(),
        EmploiDetails.routeName:(context)=>EmploiDetails(),
        OpportunityDetails.routeName:(context)=>OpportunityDetails(),
        DetailsBien.routeName:(context)=>DetailsBien(),
        ServiceDetails.routeName:(context)=>ServiceDetails(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Racine(),
      
    );
  }
}

