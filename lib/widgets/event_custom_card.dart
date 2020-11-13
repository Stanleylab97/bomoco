import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String affiche, title, location, link;
  final List<DateTime> dates;

  const EventCard(this.affiche, this.title, this.dates, this.link, this.location);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 203,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xff707070),
                width: 1,
              ),
              image: DecorationImage(
                  image: NetworkImage(affiche), fit: BoxFit.fill),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.black.withOpacity(0.33),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: 16,
                            color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
         
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location,
                  style: TextStyle(
                      fontFamily: "League",
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Text(dates[0].toString(),
                  style: TextStyle(
                      fontFamily: "Times",
                      fontSize: 13,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
