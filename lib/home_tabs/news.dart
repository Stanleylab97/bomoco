import 'package:bomoco/config/constants.dart';
import 'package:bomoco/config/shared.dart';
import 'package:bomoco/models/article.dart';
import 'package:bomoco/widgets/primary_card.dart';
import 'package:bomoco/widgets/secondary_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bomoco/home_tabs/more/news_details.dart';
import 'package:intl/intl.dart';

import 'read_news_view.dart';

class News extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .30,
            padding: EdgeInsets.only(left: 18.0),
            child: ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var news = popularList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadNewsView(news: news),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 12.0),
                    child: PrimaryCard(news: news),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: size.height * .015),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text("FIL D'ACTUALITE", style: kNonActiveTabStyle),
            ),
          ),
/*            ListView.builder(
            itemCount: popularList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              var recent = popularList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadNewsView(news: recent),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 135.0,
                  margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: SecondaryCard(news: recent),
                ),
              );
            },
          )  */
          Expanded(
            child: SingleChildScrollView(
                child: Container(
              height: size.height * .49,
              child: StreamBuilder<QuerySnapshot>(
                  stream: widget.firestore
                      .collection("informations")
                      .doc("various")
                      .collection("news")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot info = snapshot.data.docs[index];
                          var recent = Article(
                              author: info['author'],
                              content: info['content'],
                              category: info['category'],
                              publishedAt:
                                  Shared.readTimestamp(info['publishedAt']),
                              image: info['image'],
                              seen: NumberFormat.compact()
                                  .format(info['seen'])
                                  .toString(),
                              subtitle: info['subtitle'],
                              title: info['title']);

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ReadNewsView(news: recent),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: size.height * 0.16,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 8.0),
                              child: SecondaryCard(news: recent),
                            ),
                          );
                        },
                        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )),
          ),
        ],
      ),
    );
  }
}
