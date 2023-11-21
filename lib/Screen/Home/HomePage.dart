import 'package:flutter/material.dart';
import 'package:ovo_ui/Screen/Home/Component/Info_Carousel.dart';
import 'package:ovo_ui/Screen/Home/Component/Info_Menarik.dart';
//import 'package:ovo_ui/Screen/Home/Component/OVO_Cash.dart';
import 'package:ovo_ui/Screen/Home/Component/OVO_Service.dart';
import 'package:ovo_ui/Screen/Home/Component/Purple_BG.dart';
import 'package:ovo_ui/Screen/Home/Component/Service_Menu.dart';
import 'package:ovo_ui/Screen/Home/Component/welcome.dart';
import 'package:ovo_ui/Screen/MainPage/Component/MainAppbar.dart';

class HomePage extends StatefulWidget {
  final dynamic title;

  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            mainappbar(title: "null"),
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                PurpleBG(),
                Column(
                  children: <Widget>[
                    SizedBox(height: 4),
                    welcome(),
                    //OVOCash(),
                    TopUpService(),
                    ServiceMenu(),
                    InfoMenarik(),
                    InfoPromoCarousel(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}