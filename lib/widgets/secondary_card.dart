import 'package:bomoco/config/constants.dart';
import 'package:bomoco/models/article.dart';
import 'package:flutter/material.dart';

class SecondaryCard extends StatelessWidget {
  final Article news;
  SecondaryCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .118,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: kGrey3, width: 1.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    news.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kDetailContent,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(news.publishedAt, style: kDetailContent),
                      SizedBox(width: 10.0),
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kGrey1,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "${news.author}",
                        style: kDetailContent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Container(
            width: 100.0,
            height: 135.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(news.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
