import 'package:flutter/material.dart';

class Abonnement extends StatefulWidget {
  @override
  _AbonnementState createState() => _AbonnementState();
}

class _AbonnementState extends State<Abonnement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          top: true,
          right: true,
          left: true,
          child: Column(
            children: [
              Container(
                height: 50.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
                ]),
                child: Row(children: <Widget>[
                  Flexible(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                        Icon(Icons.arrow_back_ios,
                            size: 18, color: Colors.orange),
                        Text('Compte',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600))
                      ])),
                  Flexible(
                      child: Center(
                          child: Text('Souscription',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)))),
                  Flexible(child: Container()),
                ]),
              ),
              SizedBox(height: 5,),
              Flexible(
                  fit: FlexFit.tight,
                  child: Column(children: <Widget>[
                    Flexible(
                        flex: 3,
                        child: Center(
                            child: Image.asset(
                          "assets/images/subscribe.jpg",
                          fit: BoxFit.fitWidth,
                        ))),
                    Flexible(
                        flex: 2,
                        child: Center(
                          child: Text(
                            "Faîtes un choix parmi les  forfaits d'abonnement",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Flexible(
                        flex: 4,
                        child: Center(
                            child: Column(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 6, right: 6, bottom: 6),
                                  child: Row(
                                    children: [
                                      Flexible(
                                          child: Container(
                                        margin: EdgeInsets.all(6 * 0.5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 1,
                                                  blurRadius: 1),
                                            ]),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Visitor',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                  'Fonctions limitées aux actualités',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.center),
                                              Spacer(),
                                              Text(
                                                'Gratuit',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                      SizedBox(width: 6),
                                      Flexible(
                                          child: Container(
                                        margin: EdgeInsets.all(6 * 0.5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.orange),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 1,
                                                  blurRadius: 1),
                                            ]),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Master',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 6.0),
                                              Text(
                                                  'Accès aux: \n#donations\n#demandes\n#demandes de services',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.center),
                                              Spacer(),
                                              Text(
                                                '7,6 €',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'mensuel',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                      SizedBox(width: 6),
                                      Flexible(
                                          child: Container(
                                        margin: EdgeInsets.all(6 * 0.5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.orange,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 1,
                                                  blurRadius: 1),
                                            ]),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Gold',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                  'Accès total avec remise de 5%',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.center),
                                              Spacer(),
                                              Text(
                                                '86,65 €',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'annuel',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                )),
                            Text(
                                "Bomoco vous promet un accès à aux diverses données une fois l'abonnement validé",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                            SizedBox(height: 32)
                          ],
                        )))
                  ])),
              InkWell(
                onTap: () {
                  setState(() {
                    print("Element Cliked");
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.orange),
                  child: Center(
                      child: Text(
                    "Valider l'abonnement",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  )),
                ),
              )
            ],
          )),
    );
  }
}
