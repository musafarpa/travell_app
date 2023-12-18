import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/HomePageController.dart';
import 'home1.dart';

class CustomTabButton extends StatelessWidget {

  final bool isSelected;
  final VoidCallback onTap;
  final index;
  CustomTabButton(
      { required this.isSelected, required this.onTap, this.index});
  final HomePageController homeController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 2, top: 16,left: 10),
        height: 100,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [colrs[index],Colors.black45],begin: Alignment.centerLeft),
        ),

        child: Row(
          children: [
            Image.asset(
              homeController.image1[index].image1,
              height: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              homeController.image1[index].text1,
              style: GoogleFonts.anekDevanagari(
                  fontWeight: FontWeight.w600, color: beach[index]),
            )
          ],
        ),
      ),
    );
  }
}