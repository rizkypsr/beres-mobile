import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/env_learning/entities/challenge.dart';
import 'package:ovo_ui/features/env_learning/presentations/challenge_detail_screen.dart';
import 'package:ovo_ui/features/env_learning/presentations/env_learning_form_screen.dart';

class ChallengeItem extends StatelessWidget {
  const ChallengeItem({
    Key? key,
    required this.challenge,
  }) : super(key: key);

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ChallengeDetailScreen(
          challenge: challenge,
        ));
      },
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            challenge.images.isNotEmpty
                ? FullScreenWidget(
                    disposeLevel: DisposeLevel.Low,
                    child: Center(
                      child: Hero(
                        tag: challenge.id,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${baseUrl}/storage/challenges/${challenge.images[0]}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          errorWidget: (context, url, error) =>
                              Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge.judul,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    challenge.deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    "Poin yang Didapat: ${challenge.point}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Selengkapnya",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: cyantext,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
