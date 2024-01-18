import 'package:flutter/material.dart';
import 'package:ovo_ui/features/home/presentations/home_screen.dart';
import 'package:ovo_ui/core/presentations/widgets/BottomNav.dart';
import 'package:ovo_ui/Screen/MainPage/Component/MainFAB.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = new PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: MainFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(
        pageController: _pageController,
      ),
    );
  }
}
