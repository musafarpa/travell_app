import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/View/Screen/home/roomhome.dart';
import 'package:travelapp/controller/HomePageController.dart';

import '../../../controller/wishlist_controller.dart';
import '../../../models/model.dart';

class product extends StatelessWidget {

   product({super.key});
   final HomePageController homeController = Get.put(HomePageController());
   final WishlistController wishlistController =
   Get.put(WishlistController(homePageController: Get.find()));
   final WishlistController cartController =
   Get.put(WishlistController(homePageController: Get.find()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: SafeArea(
          child: Container(

            child: ListView.builder(
              itemCount: homeController.rooms.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding:
              EdgeInsets.only(right: 5, left: 10, top: 300),
              itemBuilder: (context, index) {
                final item = homeController.rooms[index];
                return InkWell(
                  onTap: () {
                    Get.to(roomcart(
                      item: homeController.rooms[index],
                      index: index,
                      texts: homeController.rooms[index].texts,
                      images:
                      homeController.rooms[index].images,
                      texts1: homeController.rooms[index].texts1,

                    ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        // width: 300,
                        margin: EdgeInsets.only(
                            left: 5, right: 15, top: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                item.images,
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(homeController.rooms[index].texts,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text(homeController.rooms[index].texts1 as String,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),)
                            ],
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
                             ),
                      ),
                      Positioned(
                          top: 20,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            child:Row(
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
        ),
      ),
    );
  }
}
