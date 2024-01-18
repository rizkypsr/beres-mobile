import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:ovo_ui/Screen/Theme.dart';
import 'package:ovo_ui/main_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
    theme: mytheme(),
  ));
}
