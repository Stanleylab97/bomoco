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
    //FirebaseServices firebaseServices = FirebaseServices();
    /* return SafeArea(
      child: Expanded(
        child: Column(
          children: [
            ListView(
              children: <Widget>[
                SizedBox(height: 15.0),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    ItemCaroussel('assets/images/sld1.jpeg',
                        'Lorem Ipsum is simply dummy text use for printing and type script'),
                    ItemCaroussel('assets/images/sld2.jpeg',
                        'Lorem Ipsum is simply dummy text use for printing and type script'),
                    ItemCaroussel('assets/images/sld3.jpeg',
                        'Lorem Ipsum is simply dummy text use for printing and type script'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCaroussel extends StatelessWidget {
  String link, title;

  ItemCaroussel(this.link, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .35,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(this.link),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ); */
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  child: ListView(children: [
                    Container(
                      width: double.infinity,
                      height: size.height * .36,
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
                                  builder: (context) =>
                                      ReadNewsView(news: news),
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
                    )
                  ]),
                ),
                Column(
                  children: [
                    SizedBox(height: size.height * .015),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 19.0),
                        child:
                            Text("FIL D'ACTUALITE", style: kNonActiveTabStyle),
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
                    Container(
                        height: size.height * .4,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: widget.firestore
                                .collection("informations")
                                .doc("various")
                                .collection("news")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                print(snapshot.data);
                                return ListView.builder(
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot info =
                                        snapshot.data.docs[index];
                                    print(info);
                                    var recent = Article(
                                        author: info['author'],
                                        content: info['content'],
                                        category: info['category'],
                                        publishedAt: Shared.readTimestamp(
                                            info['publishedAt']),
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
                                  padding:
                                      EdgeInsets.only(top: 20.0, bottom: 10.0),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            })),
                  ],
                ),
              ],
            )));
  }
}
