import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/HomePageController.dart';



class home3 extends StatelessWidget {
final texts;
final images;
  final index;
  final rating;
  final HomePageController homePageController = Get.put(HomePageController());
   home3({super.key,this.index, this.texts, this.images, this.rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    images,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    texts,
                    style: GoogleFonts.poppins(color:Theme.of(context).colorScheme.primary ,fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
               Container(
                 child: RatingBarIndicator(rating:homePageController.beaches[index].rating,
                     itemBuilder: (context, index) => Icon(Icons.star,color: Colors.amber,),
                 ),
               ),
              ],
            )

          ),
        ),
    ),
      ),
    );
  }
}
