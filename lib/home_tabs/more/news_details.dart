import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  static const routeName = "news-details";
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    final Map news = ModalRoute.of(context).settings.arguments;
    return Container();
  }
}
