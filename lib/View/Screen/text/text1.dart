// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travelapp/controller/HomePageController.dart';
//
// class WishlistController extends GetxController {
//   RxList<String> wishlist = <String>[].obs;
//
//
//   void addToWishlist(String Item) {
//     wishlist.add(Item);
//     _saveWishlist();
//   }
//
//   void removeFromWishlist(String Item) {
//     wishlist.remove(Item);
//     _saveWishlist();
//   }
//
//   Future<void> _saveWishlist() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('wishlist', wishlist);
//   }
//
//   Future<void> loadWishlist() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedWishlist = prefs.getStringList('wishlist') ?? [];
//     wishlist.value = savedWishlist.obs;
//   }
// }
//
// class MyApp777 extends StatefulWidget {
//   @override
//   State<MyApp777> createState() => _MyApp777State();
// }
//
// class _MyApp777State extends State<MyApp777> {
//   final WishlistController wishlistController = Get.put(WishlistController());
//   final HomePageController homeController = Get.put(HomePageController());
//
//   @override
//   void initState() {
//     super.initState();
//     wishlistController.loadWishlist();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Load the wishlist when the build method is called (including during hot restart).
//     wishlistController.loadWishlist();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist App'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               int index = 0; // Set the index of the item you want to add to the wishlist
//               if (index >= 0 && index < homeController.beaches.length) {
//                 wishlistController.addToWishlist(homeController.beaches[index].beach);
//               }
//             },
//             child: Text('Add Item 1 to Wishlist'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               wishlistController.addToWishlist('Item 2');
//             },
//             child: Text('Add Item 2 to Wishlist'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               wishlistController.addToWishlist('Item 3');
//             },
//             child: Text('Add Item 3 to Wishlist'),
//           ),
//           Obx(
//                 () => Column(
//               children: [
//                 Text('Wishlist Items:'),
//                 for (var Item in wishlistController.wishlist)
//                   ListTile(
//                     leading: Image.asset(Item),
//                     title: Text(Item),
//                     trailing: IconButton(
//                       icon: Icon(Icons.remove),
//                       onPressed: () {
//                         wishlistController.removeFromWishlist(Item);
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
