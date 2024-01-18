import 'package:flutter/material.dart';
import 'package:ovo_ui/features/home/entitties/article.dart';
import 'package:ovo_ui/features/home/presentations/widgets/article_detail_carousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleDetailScreen extends StatefulWidget {
  ArticleDetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  late YoutubePlayerController _controller;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.article.link)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Detail Artikel'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ArticleDetailCarousel(
                  link: widget.article.link,
                  images: widget.article.images,
                  player: player,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.judul,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        widget.article.subjudul,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    widget.article.deskripsi,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
