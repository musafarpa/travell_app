import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


import '../../../controller/HomePageController.dart';
import '../home/home1.dart';
import '../home/hotel-page.dart';
import '../home/profilebar.dart';
import '../text/text1.dart';
import '../home/wishlistpage.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();

  }


  final HomePageController homePageController = Get.put(HomePageController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _currentIndex = 0;
  final Pages=[

  ];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      key: _scaffoldKey,
      drawer: Drawer(child: profilebar()),
      body: PageView(
        onPageChanged: (index){setState(() {
          _currentIndex=index;
        });},
        controller: _pageController,
        children: [ travelhome(openDraweCallback: () { _scaffoldKey.currentState?.openDrawer() ;},),
          product(),
          WishlistPage(),
          Container(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.hotel_rounded),
            title: Text("Hotel"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Notifications"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Typicons.gift),
            title: Text("Win \$600"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );

  }
//   void openDrawer() {
//     _scaffoldKey.currentState!.openDrawer();
//   }
}
