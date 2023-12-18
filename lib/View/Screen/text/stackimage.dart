// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:travelapp/View/Screen/home/wishlistpage.dart';
//
// class profilebar extends StatelessWidget {
//   const profilebar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.white,
//       child: ListView(children: [
//         UserAccountsDrawerHeader(
//           accountName: Text("Musafar",
//               style: GoogleFonts.poppins(
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           accountEmail: Text("pamusafar1@gmail.com",
//               style: GoogleFonts.poppins(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black)),
//
//           currentAccountPicture: CircleAvatar(backgroundColor: Colors.transparent,
//             child: ClipOval(child: Image.asset("assets/man.png",),),
//           ),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,
//           // image: DecorationImage(image: AssetImage("assets/02.jpg"),fit: BoxFit.cover)
//         ),
//         ),
//         SizedBox(height: 10,),
//         ListTile(leading: Icon(Icons.account_circle,size: 35,color: Colors.black,),
//           title: Text("My Profile",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
//           onTap: () => print("jjj"),
//         ),
//         ListTile(leading: Icon(Icons.favorite,size: 35,color: Colors.black,),
//           title: Text("Favorite",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),onTap: () {
//             Get.to(WishlistPage());
//           },
//         ),
//         ListTile(leading: Icon(Icons.settings,size: 35,color: Colors.black,),
//           title: Text("My Profile",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
//           onTap: () => print("jjj"),
//         ),
//         ListTile(leading: Icon(Icons.language,size: 35,color: Colors.black,),
//           title: Text("My Profile",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
//           onTap: () => print("jjj"),
//         ),
//         ListTile(leading: Icon(Icons.gamepad,size: 35,color: Colors.black,),
//           title: Text("My Profile",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
//           onTap: () => print("jjj"),
//         ),
//         ListTile(leading: Icon(Icons.notifications,size: 35,color: Colors.black,),
//           title: Text("My Profile",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
//           onTap: () => print("jjj"),
//         ),
//
//
//       ]),
//     );
//   }
// }
