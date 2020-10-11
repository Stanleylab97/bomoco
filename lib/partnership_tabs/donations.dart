import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                    "Donations",
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
                stream: widget.firestore.collection("donateurs").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot donateur = snapshot.data.docs[index];

                        return ListTile(
                            leading: CircleAvatar(
                               radius:30.0 ,
                              backgroundImage: NetworkImage(donateur['logo']),
                            ),
                            title: Text(donateur['nom']),
                            subtitle: Text(donateur['secteur']+"\n"+donateur['localisation']));
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
