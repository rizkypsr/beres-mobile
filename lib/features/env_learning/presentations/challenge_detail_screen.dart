import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/env_learning/entities/challenge.dart';
import 'package:ovo_ui/features/env_learning/presentations/env_learning_form_screen.dart';
import 'package:ovo_ui/features/env_learning/presentations/widgets/challenge_carousel.dart';
import 'package:ovo_ui/features/verification/presentations/verification_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ChallengeDetailScreen extends StatefulWidget {
  ChallengeDetailScreen({
    Key? key,
    required this.challenge,
  }) : super(key: key);

  final Challenge challenge;

  @override
  State<ChallengeDetailScreen> createState() => _ChallengeDetailScreenState();
}

class _ChallengeDetailScreenState extends State<ChallengeDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.challenge.link)!,
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
            title: Text('Detail Challenge'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ChallengeCarousel(
                  link: widget.challenge.link,
                  images: widget.challenge.images,
                  player: player,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.challenge.judul,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        widget.challenge.deskripsi,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        "Poin yang Didapat: ${widget.challenge.point}",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final result =
                                await Get.to(VerificationScreen(), arguments: {
                              'challengeId': widget.challenge.id,
                            });

                            print(result);

                            if (result != null) {
                              Get.to(EnvLearningFormScreen(), arguments: {
                                'userId': result['userId'],
                                'userType': result['userType'],
                                'challengeId': widget.challenge.id,
                              });
                            }
                          },
                          child: Text(
                            'Ikuti Challenge',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkpurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      )
                    ],
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
