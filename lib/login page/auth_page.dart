import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/View/Screen/dashborad/mainscreen.dart';
import 'package:travelapp/View/Screen/texttab.dart';
import 'package:travelapp/login%20page/login%20or%20signup.dart';
import 'package:travelapp/login%20page/login_page.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
    stream:FirebaseAuth.instance.authStateChanges(),
    builder:(BuildContext context,AsyncSnapshot<User?> snapshot ) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
      } else{
        if (snapshot.hasData) {
        return screen();
      } else {
          return const loginandsignup();
        }
      }
    },
    )
    );
  }
}
