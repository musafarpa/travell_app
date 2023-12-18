import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/models/model.dart';

import 'HomePageController.dart';

// Define the common base class
abstract class ModelBase {
  String images;

  ModelBase(this.images); // Add a generative constructor

  Map<String, dynamic> toJson();

  factory ModelBase.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError("fromJson method not implemented");
  }
}

// Define Imagemodel
class Imagemodel extends ModelBase {
  String texts;

  Imagemodel({required String images, required this.texts}) : super(images);

  @override
  Map<String, dynamic> toJson() {
    return {'images': images, 'texts': texts};
  }

  @override
  factory Imagemodel.fromJson(Map<String, dynamic> json) {
    return Imagemodel(images: json['images'], texts: json['texts']);
  }
}

// Define Beachmodel
class Beachmodel extends ModelBase {
  String texts;

  Beachmodel({required String images, required this.texts}) : super(images);

  @override
  Map<String, dynamic> toJson() {
    return {'images': images, 'texts': texts};
  }

  @override
  factory Beachmodel.fromJson(Map<String, dynamic> json) {
    if (json['images'] is String && json['texts'] is String) {
      return Beachmodel(images: json['images'], texts: json['texts']);
    } else {
      throw FormatException("Invalid JSON format for Beachmodel");
    }
  }
}


class WishlistController extends GetxController {
  final HomePageController homePageController; // Add a reference to HomePageController

  WishlistController({required this.homePageController});

  List<dynamic> wishlist = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWishlist();
  }

  void addToWishlist(dynamic item) {
    if (!isItemInWishlist(item)) {
      wishlist.add(item);
      Showsnakbar();
      saveWishlist();

    }
  }

  void removeFromWishlist(dynamic item) {
    final itemIndex = wishlist.indexWhere((element) => element.images == item.images);
    if (itemIndex != -1) {
      wishlist.removeAt(itemIndex);
      saveWishlist();
      Showsnakbar1();
    }
  }

  bool isItemInWishlist(dynamic item) {
    return wishlist.any((element) => element.images == item.images);
  }

  Future<void> saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistData = wishlist.map((item) => item.toJson()).toList();
    await prefs.setString('wishlist', json.encode(wishlistData));
  }

  Future<void> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlistData = prefs.getString('wishlist');
    if (wishlistData != null) {
      final decodedWishlist = json.decode(wishlistData) as List<dynamic>;
      wishlist.assignAll(decodedWishlist.map((item) {
        if (item['texts'] != null) {
          return Imagemodel.fromJson(item);
        } else if (item['images'] != null) {
          return Beachmodel.fromJson(item);
        } else if (item['images'] != null) {
          return mounmodel.fromJson(item);
        } else if (item['images'] != null) {
          return lakemodel.fromJson(item);
        } else if (item['images'] != null) {
          return rivermodel.fromJson(item);
        }

      }));
    }
  }

  Showsnakbar() {
    Get.snackbar(
      'Succesfully added',
      'to wishlist',
      snackPosition: SnackPosition.BOTTOM, // You can change the position
      backgroundColor: Colors.black54,
      colorText: Colors.white,
      duration: Duration(seconds: 1),
    );
  }

Showsnakbar1() {
  Get.snackbar(
    'Remove',
    'to wishlist',
    snackPosition: SnackPosition.BOTTOM, // You can change the position
    backgroundColor: Colors.black54,
    colorText: Colors.white,
    duration: Duration(seconds: 1),
  );
}



}