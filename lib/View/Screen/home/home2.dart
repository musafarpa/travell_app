import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/HomePageController.dart';
import '../../../controller/wishlist_controller.dart';
import 'wishlistpage.dart';
import 'fav_button.dart';

class christ extends StatelessWidget {
  final String images;
  final String text1;
  final String text2;
  final String text3;
  final index;
  final item;
  christ(
      {super.key,
      required this.images,
      required this.text1,
      required this.text2,
      required this.text3,
      this.index,
      this.item});
  final HomePageController homePageController = Get.put(HomePageController());
  final WishlistController wishlistController =
      Get.put(WishlistController(homePageController: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  images,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black26.withOpacity(0.3),
                  BlendMode.darken,
                )),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 100,
            leadingWidth: 90,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              color: Colors.white10,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.black26,
                  child: Center(
                      child: Icon(Icons.arrow_back_ios_rounded,
                          size: 40, color: Colors.white))),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black26,
                  child: IconButton(
                    icon: Obx(() {
                      // Use Obx to listen for changes and update the favorite icon
                      final isItemInWishlist =
                          wishlistController.isItemInWishlist(item);
                      return isItemInWishlist
                          ? Icon(Icons.favorite,color: Colors.white,)
                          : Icon(Icons.favorite_border);
                    }),
                    onPressed: () {
                      // Call the toggleFavoriteStatus function
                      if (wishlistController.isItemInWishlist(item)) {
                        wishlistController.removeFromWishlist(item);
                      } else {
                        wishlistController.addToWishlist(item);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 380,
                  ),
                  Text(
                    text1,
                    style: GoogleFonts.aclonica(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    text2,
                    style: GoogleFonts.abel(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   text3,
                  //   style: GoogleFonts.radioCanada(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 19),
                  // ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              "Expolre Now",
                              style: GoogleFonts.davidLibre(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,color:Colors.black,
                              ),
                            ),
                            Icon(Icons.double_arrow,color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
