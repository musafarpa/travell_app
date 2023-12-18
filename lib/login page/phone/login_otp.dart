

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp/login%20page/phone/verifyotp.dart';

class loginotp extends StatefulWidget {

  const loginotp({super.key,});

  @override
  State<loginotp> createState() => _loginotpState();
}

class _loginotpState extends State<loginotp> {

  bool loading = false;
  final otpController  = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 80,),
              TextFormField(

                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "+91 1234567890",
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(

                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                    phoneNumber: "+91${otpController.text}",
                      timeout: const Duration(seconds: 60),
                      verificationCompleted: (_){
                        setState(() {
                          loading = false;
                        });

                      },
                      verificationFailed: (e){
                        setState(() {
                          loading = false;
                        });


                      },
                      codeSent: (String verificationId, int? token){
                        setState(() {
                          loading = false;
                        });
                        Get.to(() => verifyotp(verificationId: verificationId));

                      },
                      codeAutoRetrievalTimeout: (e){

                      });

                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('Login',),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
