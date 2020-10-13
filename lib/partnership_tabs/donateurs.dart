import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Donateurs extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  _DonateursState createState() => _DonateursState();
}

class _DonateursState extends State<Donateurs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .008),
          height: MediaQuery.of(context).size.height * .13,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .08,
                      left: MediaQuery.of(context).size.width * .05),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Text(
                    "Donateurs",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              Divider(
                color: Colors.grey,
                height: 1.0,
              ),
            ],
          ),
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: widget.firestore
                    .collection("partnership")
                    .doc("various")
                    .collection("givers")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot donateur = snapshot.data.docs[index];

                        return Card(
                          elevation: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 160,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(donateur['logo']),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(donateur['nom'],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(donateur['secteur']),
                                  Text(donateur['localisation'])
                                ],
                              )
                            ],
                          ),
                          /* title: Text(donateur['nom']),
                            subtitle: Text(donateur['secteur'] +
                                "\n" +
                                donateur['localisation']) */
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
