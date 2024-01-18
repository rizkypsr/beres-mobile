import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ovo_ui/Screen/Home/Component/Info_Carousel.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Service.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/features/help/presentations/help_screen.dart';
import 'package:ovo_ui/Screen/Home/Component/welcome.dart';
import 'package:ovo_ui/features/home/controllers/article_controller.dart';
import 'package:ovo_ui/features/home/presentations/widgets/article_section.dart';
import 'package:ovo_ui/features/home/presentations/widgets/service_list.dart';

class HomeScreen extends StatelessWidget {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logoberes.png",
          fit: BoxFit.cover,
          height: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: IconButton(
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HelpScreen();
                }));
              },
              icon: Icon(
                Icons.help,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: () async {
          await articleController.fetchData();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  PurpleBG(),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 4),
                      welcome(),
                      TopUpService(),
                      ServiceList(),
                      ArticleSection(),
                      InfoPromoCarousel(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
