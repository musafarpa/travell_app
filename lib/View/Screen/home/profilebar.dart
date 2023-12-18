import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/View/Screen/details_page/chatscreen/chatUserList.dart';
import 'package:travelapp/View/Screen/home/wishlistpage.dart';
import 'package:travelapp/controller/theme-controller.dart';
import 'package:travelapp/login%20page/auth_page.dart';

import '../../../theme/theme.dart';
import '../details_page/maps.dart';

class profilebar extends StatefulWidget {
  const profilebar({super.key});

  @override
  State<profilebar> createState() => _profilebarState();
}

class _profilebarState extends State<profilebar> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final ThemeController themecontroller = Get.put(ThemeController());
    // bool isToggled = false;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(children: [
        UserAccountsDrawerHeader(
          accountName: Text("Musafar",
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.background,
              )),
          accountEmail: Text(user?.email?? "Guest" ,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.background,
              )),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                "assets/man.png",
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
             boxShadow: [
              BoxShadow(
              offset: Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
            // image: DecorationImage(image: AssetImage("assets/02.jpg"),fit: BoxFit.cover)
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "My Profile",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          onTap: () => print("jjj"),
        ),
        ListTile(
          leading: Icon(
            Icons.image,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "Favorite",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            Get.to(WishlistPage());
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "My Profile",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          onTap: () => print("jjj"),
        ),
        ListTile(
          leading: Icon(
            Icons.language,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "Maps",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          onTap: () =>  Get.to(maps()),
        ),
        ListTile(
          leading: Icon(
            Icons.message_rounded,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "Feedback",
            style:
                GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          onTap: () => Get.to(chatt()),
        ),
        ListTile(
            leading: Icon(
              Icons.dark_mode,
              size: 35,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "Dark",
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
            onTap: () => print("jjj"),
            trailing: Obx(() {
              return Switch(
                value: themecontroller.currentTheme.value == darkmode,
                onChanged: (value) {
                  themecontroller.toggleTheme();
                },
              );
            })),
        ListTile(
          leading: Icon(
            Icons.logout,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            "Logout",
            style:
            GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          onTap: ()async {
          await  FirebaseAuth.instance.signOut();
           Get.to(()=> Authpage());
          },
        ),
      ]),
    );
  }
}
