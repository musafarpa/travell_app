import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../controller/HomePageController.dart';
import '../../../controller/wishlist_controller.dart';

class WishlistItem {
  final String text;
  final String image;

  WishlistItem({required this.text, required this.image});

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      text: json['text'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'image': image,
    };
  }
}



class WishlistPage extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController(homePageController: Get.find()));
  final HomePageController homeController = Get.put(HomePageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
          child: Center(child: Text("LIKES,",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20),))),
          SizedBox(height: 20,),
          // Display items from image1 at the top

          // Display wishlist items in a ListView
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: wishlistController.wishlist.length,
                itemBuilder: (context, index) {
                  final item = wishlistController.wishlist[index];
                  final isItemInWishlist = wishlistController.isItemInWishlist(item);

                  return Padding(
                    padding: EdgeInsets.only(right: 10,left: 10,top: 10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),  // Add this line to set the border radius
                            color: Colors.black54,
                          ),
                          child: ClipRRect(  // Use ClipRRect to apply the border radius to the child (in this case, the image)
                            borderRadius: BorderRadius.circular(10),  // Set the same border radius as the parent container
                            child: Image.asset(
                              item.images,
                              height: 200,
                              fit: BoxFit.cover, // You can adjust the fit based on your needs
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          item.texts ?? "",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 9),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, size: 15),
                          onPressed: () {
                            wishlistController.removeFromWishlist(item);
                          },
                        ),

                      ],
                    ),
                  );

                },
              ),
            ),
          ),

        ],

      ),

    );
  }
}
