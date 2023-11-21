import 'package:flutter/material.dart';
import 'package:ovo_ui/Screen/Home/HomePage.dart';
import 'package:ovo_ui/Screen/MainPage/Component/MainBtmNavbar.dart';
import 'package:ovo_ui/Screen/MainPage/Component/MainFAB.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController? _pagecontroller;
  // FirebaseMessaging messaging;

  @override
  void initState() {
    _pagecontroller = new PageController(initialPage: 0);
    super.initState();
    // FirebaseMessaging.instance.subscribeToTopic('general');
    // NotificationTest();
  }

  @override
  void dispose() {
    _pagecontroller!.dispose();
    super.dispose();
  }

  // void NotificationTest() {
  //   messaging = FirebaseMessaging.instance;
  //   // Get TOken
  //   messaging.getToken().then((value) {
  //     String token = value;
  //     print(token);
  //   });

  //   FirebaseMessaging.onMessage.listen((RemoteMessage event) {
  //     print("message recieved");
  //     print(event.notification.body);
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((message) {
  //     print('Message clicked!');
  //   });
  //   messaging.subscribeToTopic("general");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: _pagecontroller,
        children: [
          HomePage(),
          //insert, Deals page, Finance page, Profile page here
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: MainFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainBottomNavBar(
        pageController: _pagecontroller,
      ),
    );
  }
}
