import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ovo_ui/Screen/MainPage/MainPage.dart';
import 'package:ovo_ui/Screen/Theme.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  //FlutterNativeSplash.removeAfter(initialization);
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  debugPaintSizeEnabled = false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
    theme: mytheme(),
  ));
}
