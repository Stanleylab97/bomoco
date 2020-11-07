import 'dart:io';
import 'package:bomoco/widgets/tv_components/hero_widget.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailsTVPage extends StatefulWidget {
  final Object heroTag;
  final String desc;
  final String videoUrl;

  const DetailsTVPage({
    Key key,
    @required this.heroTag,
    @required this.desc,
    @required this.videoUrl,
  }) : super(key: key);

  @override
  _DetailsTVPageState createState() =>
      _DetailsTVPageState();
}

class _DetailsTVPageState
    extends State<DetailsTVPage> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      //* VideoPlayer Network constructor for playing video from internet
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),

      
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la vidéo'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeroWidget(context),
          _buildDesc(),
        ],
      ),
    );
  }

  HeroWidget _buildHeroWidget(BuildContext context) {
    return HeroWidget(
      heroTag: widget.heroTag,
      width: MediaQuery.of(context).size.width,
      builder: (BuildContext context) {
        return _buildHeroWidgetContent();
      },
    );
  }

  Chewie _buildHeroWidgetContent() {
    return Chewie(
      controller: _chewieController,
    );
  }

  Widget _buildDesc() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.desc,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
