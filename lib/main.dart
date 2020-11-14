import 'package:bomoco/account_tabs/login.dart';
import 'package:bomoco/bottomNavBar.dart';
import 'package:bomoco/home_tabs/more/affaire_details.dart';
import 'package:bomoco/home_tabs/more/emploi_details.dart';
import 'package:bomoco/home_tabs/more/opportunity_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'BottomNavBar/account.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Account.routeName: (context) => Account(),
        AffaireDetails.routeName: (context) => AffaireDetails(),
        EmploiDetails.routeName: (context) => EmploiDetails(),
        OpportunityDetails.routeName: (context) => OpportunityDetails(),
        DrivingLicence.routeName: (context) => DrivingLicence(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DrivingLicence(),
    );
  }
}

class DrivingLicence extends StatefulWidget {
  static const routeName = "/launcher";
  @override
  _DrivingLicenceState createState() => new _DrivingLicenceState();
}

class _DrivingLicenceState extends State<DrivingLicence> {
  
  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      seconds: 14,
      image: Image.asset(
        "assets/images/logo.gif",
        fit: BoxFit.fill,
        width: 400, height: 300
      ),
      navigateAfterSeconds: Racine(),
      backgroundColor: Colors.white,
      photoSize: MediaQuery.of(context).size.height * 0.30,
      loaderColor: Colors.orange,
    );
  }
}
