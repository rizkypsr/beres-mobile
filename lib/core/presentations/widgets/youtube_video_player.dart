import 'package:flutter/material.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  YoutubeVideoPlayer({Key? key, required this.link}) : super(key: key);

  final String link;

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    );
  }
}
