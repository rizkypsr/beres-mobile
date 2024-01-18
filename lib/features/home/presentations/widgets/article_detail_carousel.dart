import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';

class ArticleDetailCarousel extends StatelessWidget {
  const ArticleDetailCarousel({
    Key? key,
    required this.link,
    required this.images,
    required this.player,
  }) : super(key: key);

  final String link;
  final List<String> images;
  final Widget player;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SizedBox(
          width: double.infinity,
          child: player,
        ),
        for (var image in images)
          FullScreenWidget(
            disposeLevel: DisposeLevel.Low,
            child: Center(
              child: Hero(
                tag: image,
                child: CachedNetworkImage(
                  imageUrl: "${baseUrl}/storage/artikel/${image}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
          ),
      ],
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
