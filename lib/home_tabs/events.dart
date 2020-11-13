import 'package:bomoco/widgets/event_custom_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 2),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Evènements en vue",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Times",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: widget.firestore
                    .collection("informations")
                    .doc("various")
                    .collection("events")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot event = snapshot.data.docs[index];
                        List<DateTime> dates=[];
                        dates.add(DateTime.fromMillisecondsSinceEpoch(
                            event['dates'][0].seconds * 1000));
                        return EventCard(event['affiche'], event['title'],
                            dates, event['link'],event['lieu']);
                      },
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
