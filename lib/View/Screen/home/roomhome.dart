import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../controller/roomcart-controller.dart';
import '../../../models/model.dart';
import 'cartpage.dart';
import 'package:http/http.dart' as http;


class roomcart extends StatefulWidget {
  final texts;
  final images;
  final index;
  final texts1;
  final roommodel item;
  const roomcart({super.key, this.texts, this.images, this.index, this.texts1, required this.item});

  @override
  State<roomcart> createState() => _roomcartState();
}

class _roomcartState extends State<roomcart> {
final CartController cartController=Get.find();
  Map<String,dynamic>? paymentIntent;

  Future<void> makepayment()async{
    try {
      String totalAmount = widget.texts1;
      final amountAsDouble = int.parse(totalAmount);
      final multipliedAmount = amountAsDouble * 100;
      String resultString = multipliedAmount.toString();

      print("---------------------------------------");
      print(totalAmount);

      // Pass multipliedAmount to createpaymentIntent
      paymentIntent = await createpaymentIntent(resultString, "INR");

      var gpay = PaymentSheetGooglePay(
        merchantCountryCode: "INR",
        currencyCode: "US", // Note: Make sure the currency code is correct
        testEnv: true,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!["client_secret"],
          style: ThemeMode.dark,
          merchantDisplayName: "Hopper",
          googlePay: gpay,
        ),
      );

      displayPaymentSheet();
    }catch(e){

    }
  }

  Future<void> displayPaymentSheet() async{
    try{
      await Stripe.instance.presentPaymentSheet();
      print("Done");
    } catch(e){
      print("Failed");

    }
  }

  createpaymentIntent(String totalAmount,String currency)async{
    try {
      Map<String,dynamic> body ={
        "amount": totalAmount,
        "currency": currency,
      };
      http.Response response=await http.post(Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            "Authorization":"Bearer sk_test_51OA5tNSJxvrWEbcJNRDOsyZUH0jQW8wBF04rhrBMaIMpcMKKXiJ11Bzm6HdU7Y2EAbjU95JOtv0pSkeeeqimZ9wk00R8RBsJ2h",
            "Content-Type":"application/x-www-form-urlencoded",
          }
      );
      return json.decode(response.body);
    }catch (e) {
      throw Exception(e.toString());
    }
  }

@override
Widget build(BuildContext context) {
  final CartController cartController= Get.find();
  return Scaffold(
    bottomSheet:

    Container(height: 90,
        width: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),


        child: Align(
          alignment: Alignment.centerRight,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed:  makepayment,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(widget.texts1),
                      SizedBox(width: 80,),
                      Text("Book now", style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold)),
                      // Icon(Icons.account_circle,color: Colors.white,)
                    ],
                  ),
                ),
              ),
              SizedBox(width: 100,),
              SizedBox(
                height: 50,
                child: ElevatedButton(

                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () { cartController.addToCart(widget.item);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Text("Add to cart ", style: TextStyle(color: Colors.black)),
                      Icon(Icons.add_shopping_cart_sharp,color: Colors.black,)],
                  ),
                ),
              ),
            ],
          ),
        )

    ),

    appBar: AppBar(
      actions: [
        GestureDetector(
          onTap: () => Get.to(CartScreen()),
          child: Center(
              child: Obx(
                    () => Badge(
                  label: Text('${cartController.cartItems.length}'),
                  child: Icon(Icons.shopping_bag),
                ),
              )

          ),
        ),
        SizedBox(width: 20), // You can adjust the width here
      ],
    ),
    backgroundColor: Theme.of(context).colorScheme.background,
    body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.images,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    widget.texts,
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.texts1,style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ),
    ),
  );
}
}
