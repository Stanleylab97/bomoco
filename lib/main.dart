import 'package:bomoco/account_tabs/login.dart';
import 'package:bomoco/bottomNavBar.dart';
import 'package:bomoco/home_tabs/more/affaire_details.dart';
import 'package:bomoco/home_tabs/more/emploi_details.dart';
import 'package:bomoco/home_tabs/more/news_details.dart';
import 'package:bomoco/home_tabs/more/opportunity_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'BottomNavBar/account.dart';
import 'BottomNavBar/home.dart';
import 'account_tabs/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Account.routeName: (context) => Account(),
        AffaireDetails.routeName: (context) => AffaireDetails(),
        EmploiDetails.routeName: (context) => EmploiDetails(),
        OpportunityDetails.routeName: (context) => OpportunityDetails(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Racine(),
    );
  }
}
