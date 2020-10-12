import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Operateurs extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  _OperateursState createState() => _OperateursState();
}

class _OperateursState extends State<Operateurs> {
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
                    "Opérateurs",
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
                stream: widget.firestore.collection("operateurs").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot operateur = snapshot.data.docs[index];

                        return ListTile(
                            leading: CircleAvatar(
                              
                              backgroundImage: NetworkImage(operateur['logo']),
                            ),
                            title: Text(operateur['nom']),
                            subtitle: Text(operateur['secteur'] +
                                "\n" +
                                operateur['localisation']));
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
