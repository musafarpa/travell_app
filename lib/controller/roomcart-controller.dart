import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/model.dart';

class CartController extends GetxController {
  var cartItems = <roommodel>[].obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void addToCart(roommodel item) {
    if (cartItems.contains(item)) {
      // Item is already in the cart, show a message
      Get.snackbar(
        duration: Duration(milliseconds: 800),
        'Already in Cart',
        '${item.texts} is already in your cart',
        snackPosition: SnackPosition.TOP,
      );
    } else {
      // Item is not in the cart, add it and show a success message
      cartItems.add(item);
      saveCartItems();
      Get.snackbar(
        duration: Duration(milliseconds: 800),
        'Added to Cart',
        '${item.texts} added to your cart',
        snackPosition: SnackPosition.TOP,
      );
    }
  }



  void removeFromCart(roommodel item) {
    cartItems.remove(item);
    saveCartItems();
    Get.snackbar(
      duration: Duration(milliseconds: 800),
      'Removed from Cart',
      '${item.texts} removed from your cart',
      snackPosition: SnackPosition.BOTTOM,
    );
  }


  void saveCartItems() {
    final List<Map<String, dynamic>> cartItemsMapList =
    cartItems.map((item) => item.toJson()).toList();
    box.write('cartItems', cartItemsMapList);
  }

  void loadCartItems() {
    final List<Map<String, dynamic>>? savedCartItemsMapList =
    (box.read('cartItems') as List?)?.cast<Map<String, dynamic>>();

    if (savedCartItemsMapList != null) {
      cartItems.assignAll(
        savedCartItemsMapList.map((itemMap) => roommodel.fromJson(itemMap)).toList(),
      );
    }
  }

}
