import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Constant/ApiUrl.dart';
import 'package:ovo_ui/Constant/Color.dart';
import 'package:ovo_ui/features/home/controllers/info_controller.dart';

class Imagecarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InfoController infoController = Get.put(InfoController());

    return Obx(() {
      if (infoController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (infoController.info.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 42),
            child: Text('Tidak ada info dan promo spesial'),
          ),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  height: 126,
                  onPageChanged: (index, reason) {
                    infoController.changeIndex(index);
                  }),
              items: infoController.info.map((e) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FullScreenWidget(
                      disposeLevel: DisposeLevel.Low,
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: "$baseUrl/storage/banner/${e.image}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorWidget: (context, url, error) =>
                              Center(child: Icon(Icons.error)),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: infoController.info.map((info) {
                int index = infoController.info.indexOf(info);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: infoController.currentIndex.value == index
                        ? cyantext
                        : Colors.grey, // Customize the indicator color
                  ),
                );
              }).toList(),
            ),
          ],
        );
      }
    });
  }
}
