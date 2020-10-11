import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Temoignages extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  _TemoignagesState createState() => _TemoignagesState();
}

class _TemoignagesState extends State<Temoignages> {
  var temoignages;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .008),
          height: MediaQuery.of(context).size.height * .13,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .08,
                      left: MediaQuery.of(context).size.width * .05),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Text(
                    "Interventions",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
                  Divider(color: Colors.grey, height: 1.0,),
            ],
          ),
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: widget.firestore.collection("testimonials").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot temoignage = snapshot.data.docs[index];
                        return Card(
                          margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 0),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(temoignage['contenu']),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        temoignage['auteur'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      },
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }))
      ],
    );
  }
}
