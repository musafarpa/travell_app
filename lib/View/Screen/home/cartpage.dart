import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/roomcart-controller.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Text("checkout", style: TextStyle(color: Colors.white)),
        ),
      ),
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          final item = cartController.cartItems[index];
          return ListTile(
            leading: Image.asset(item.images,height: 250,),
            title: Text(item.texts,style:GoogleFonts.poppins(fontWeight: FontWeight.bold),),
            subtitle: Text(item.texts1 as String),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartController.removeFromCart(item);
              },
            ),
          );
        },
      )),
    );
  }
}
