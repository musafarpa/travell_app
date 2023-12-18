import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/View/Screen/home/hotel-page.dart';
import 'package:travelapp/View/Screen/home/profilebar.dart';
import 'package:travelapp/models/model.dart';

import '../../../controller/HomePageController.dart';
import '../../../controller/wishlist_controller.dart';
import '../details_page/showall.dart';
import 'categories.dart';
import 'home1.dart';
import 'home1.dart';
import 'home2.dart';
import 'dart:core';

import 'home3.dart';

List<Color> colrs = [
  Colors.orangeAccent,
  Colors.blueGrey,
  Colors.lime,
  Colors.lightGreen
];

List<Color> beach = [Colors.white, Colors.white, Colors.white, Colors.white];

class travelhome extends StatefulWidget {
  final Function() openDraweCallback;

  travelhome({super.key, required this.openDraweCallback});

  @override
  State<travelhome> createState() => _travelhomeState();
}

class _travelhomeState extends State<travelhome> with TickerProviderStateMixin {
  late TabController _tabController;
  final HomePageController homeController = Get.put(HomePageController());
  final WishlistController wishlistController =
      Get.put(WishlistController(homePageController: Get.find()));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);
    // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(

     backgroundColor: Theme.of(context).colorScheme.background,
      drawer: Drawer(child: profilebar()),
      body: SafeArea(

        child: Container(
          child: DefaultTabController(
            length: 4,
            child: ListView(
              // physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 28, left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.openDraweCallback();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: Colors.white30),
                          child: Center(child: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary,)),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white30),
                        child: Center(child: Icon(Icons.search, color: Theme.of(context).colorScheme.primary,)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    top: 34,
                  ),
                  child: Text(
                    "Explore\nThe Nature",
                    style: GoogleFonts.playfairDisplay(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 48,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 28,right: 2),
                  child: TabBar(
                      labelPadding: EdgeInsets.only(left: 10, right: 24),
                      indicatorPadding: EdgeInsets.only(left: 14, right: 14),
                      isScrollable: true,
                      labelColor: Theme.of(context).colorScheme.primary,
                      indicatorColor: Colors.grey,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: GoogleFonts.lato(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      // dragStartBehavior: DragStartBehavior.start,

                      tabs: [
                        Tab(
                          child: Text("Recommened"),
                        ),
                        Tab(
                          child: Text("Popular"),
                        ),
                        Tab(
                          child: Text("New Destination"),
                        ),
                        Tab(
                          child: Text("Hidden Gems"),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 200,
                  // width: 300,
                  child: TabBarView(children: [
                    Container(
                      height: 400,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 30,
                        ),
                        itemCount: homeController.imagelist.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return OpenContainer(
                            openElevation: 0,
                            closedElevation: 0,
                            transitionDuration: Duration(seconds: 2),
                            middleColor: Colors.transparent,
                            openColor: Colors.transparent,
                            closedColor: Colors.transparent,
                            transitionType: ContainerTransitionType.fadeThrough,
                            openBuilder:
                                (BuildContext context, VoidCallback _) {
                              return christ(
                                item: homeController.imagelist[index],
                                images: homeController.imagelist[index].images,
                                text1: homeController.cristdata[index].text1,
                                text2: homeController.cristdata[index].text2,
                                text3: homeController.cristdata[index].text3,
                                index: index,
                              );
                            },
                            closedBuilder:
                                (BuildContext context, void Function() action) {
                              return Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    // width: 300,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 15, right: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        homeController.imagelist[index].images,
                                        fit: BoxFit.cover,
                                        width: 300,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 160,
                                      left: 30,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.black26),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              homeController
                                                  .textlist[index].texts,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              );
                            },
                          );
                        },
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Icon(Icons.abc),
                    Icon(Icons.ac_unit),
                    Icon(Icons.ac_unit),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30, bottom: 5),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: homeController.imagelist.length,
                    effect: const WormEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      type: WormType.thinUnderground,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 28, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Popular Categories",
                        style: GoogleFonts.playfairDisplay(
                            color:Theme.of(context).colorScheme.primary,
                            fontSize: 28,

                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => show(),
                            ),
                          );
                        },
                        child: Text(
                          "Show All",
                          style: GoogleFonts.lato(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.image1.length,
                        itemBuilder: (context, index) {
                          return CustomTabButton(
                            index: index,
                            isSelected: _tabController.index == index,
                            onTap: () {
                              _tabController.animateTo(index);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: TabBarView(controller: _tabController, children: [
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 10, top: 5),
                          height: 200,
                          child: ListView.builder(
                            itemCount: homeController.beaches.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding:
                                EdgeInsets.only(right: 5, left: 10, top: 10),
                            itemBuilder: (context, index) {
                              final item = homeController.beaches[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(home3(
                                    index: index,
                                    texts: homeController.beaches[index].texts,
                                    images:
                                        homeController.beaches[index].images,
                                  ));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 150,
                                      // width: 300,
                                      margin: EdgeInsets.only(
                                          left: 5, right: 15, top: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: Image.asset(
                                          item.images,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 10,
                                      child: Container(
                                          height: 50,
                                          width: 180,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.transparent),
                                          child: Center(
                                              child: Text(
                                            homeController.beaches[index].texts,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ))),
                                    ),
                                    Positioned(
                                        top: 20,
                                        right: 20,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Obx(() {
                                                  // Use Obx to listen for changes and update the favorite icon
                                                  final isItemInWishlist =
                                                      wishlistController
                                                          .isItemInWishlist(
                                                              item);
                                                  return isItemInWishlist
                                                      ? Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        )
                                                      : Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.white,
                                                        );
                                                }),
                                                onPressed: () {
                                                  // Call the toggleFavoriteStatus function
                                                  if (wishlistController
                                                      .isItemInWishlist(item)) {
                                                    wishlistController
                                                        .removeFromWishlist(
                                                            item);
                                                  } else {
                                                    wishlistController
                                                        .addToWishlist(item);
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 10, top: 5),
                            height: 200,
                            child: ListView.builder(
                              itemCount: homeController.mountains.length,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              padding:
                                  EdgeInsets.only(right: 5, left: 10, top: 10),
                              itemBuilder: (context, index) {
                                final item = homeController.mountains[index];
                                return InkWell(
                                  onTap: () => Get.to(home3(    index: index,
                                    texts: homeController.mountains[index].texts,
                                    images:
                                    homeController.mountains[index].images,)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        // width: 300,
                                        margin: EdgeInsets.only(
                                            left: 5, right: 15, top: 20),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Image.asset(
                                            item.images,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        left: 10,
                                        child: Container(
                                            height: 50,
                                            width: 180,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.transparent),
                                            child: Center(
                                                child: Text(
                                              homeController.mountains[index].texts,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ))),
                                      ),
                                      Positioned(
                                          top: 20,
                                          right: 10,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Obx(() {
                                                      // Use Obx to listen for changes and update the favorite icon
                                                      final isItemInWishlist =
                                                          wishlistController
                                                              .isItemInWishlist(
                                                                  item);
                                                      return isItemInWishlist
                                                          ? Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color:
                                                                  Colors.white,
                                                            );
                                                    }),
                                                    onPressed: () {
                                                      // Call the toggleFavoriteStatus function
                                                      if (wishlistController
                                                          .isItemInWishlist(
                                                              item)) {
                                                        wishlistController
                                                            .removeFromWishlist(
                                                                item);
                                                      } else {
                                                        wishlistController
                                                            .addToWishlist(
                                                                item);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              )))
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 10, top: 5),
                            height: 200,
                            child: ListView.builder(
                              itemCount: homeController.lakes.length,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              padding:
                                  EdgeInsets.only(right: 5, left: 10, top: 10),
                              itemBuilder: (context, index) {
                                final item = homeController.lakes[index];
                                return InkWell(
                                  onTap: () => Get.to(home3(    index: index,
                                    texts: homeController.lakes[index].texts,
                                    images:
                                    homeController.lakes[index].images,)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        // width: 300,
                                        margin: EdgeInsets.only(
                                            left: 5, right: 15, top: 15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            item.images,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        left: 10,
                                        child: Container(
                                            height: 50,
                                            width: 180,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.transparent),
                                            child: Center(
                                                child: Text(
                                              homeController.lakes[index].texts,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ))),
                                      ),
                                      Positioned(
                                          top: 20,
                                          right: 10,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Obx(() {
                                                      // Use Obx to listen for changes and update the favorite icon
                                                      final isItemInWishlist =
                                                          wishlistController
                                                              .isItemInWishlist(
                                                                  item);
                                                      return isItemInWishlist
                                                          ? Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Colors.white,
                                                            );
                                                    }),
                                                    onPressed: () {
                                                      // Call the toggleFavoriteStatus function
                                                      if (wishlistController
                                                          .isItemInWishlist(
                                                              item)) {
                                                        wishlistController
                                                            .removeFromWishlist(
                                                                item);
                                                      } else {
                                                        wishlistController
                                                            .addToWishlist(item);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              )))
                                    ],
                                  ),
                                );
                              },
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 10, top: 5),
                            child: ListView.builder(
                              itemCount: homeController.rivers.length,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              padding:
                                  EdgeInsets.only(right: 5, left: 10, top: 10),
                              itemBuilder: (context, index) {
                                final item = homeController.rivers[index];
                                return InkWell(onTap: () => Get.to(home3(    index: index,
                                  texts: homeController.rivers[index].texts,
                                  images:
                                  homeController.rivers[index].images,)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        // width: 300,
                                        margin: EdgeInsets.only(
                                            left: 5, right: 15, top: 15),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            item.images,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        left: 10,
                                        child: Container(
                                            height: 50,
                                            width: 180,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.transparent),
                                            child: Center(
                                                child: Text(
                                              homeController.rivers[index].texts,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ))),
                                      ),
                                      Positioned(
                                          top: 20,
                                          right: 10,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Obx(() {
                                                      // Use Obx to listen for changes and update the favorite icon
                                                      final isItemInWishlist =
                                                          wishlistController
                                                              .isItemInWishlist(
                                                                  item);
                                                      return isItemInWishlist
                                                          ? Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Colors.white,
                                                            );
                                                    }),
                                                    onPressed: () {
                                                      // Call the toggleFavoriteStatus function
                                                      if (wishlistController
                                                          .isItemInWishlist(
                                                              item)) {
                                                        wishlistController
                                                            .removeFromWishlist(
                                                                item);
                                                      } else {
                                                        wishlistController
                                                            .addToWishlist(item);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              )))
                                    ],
                                  ),
                                );
                              },
                            )),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
