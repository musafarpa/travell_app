import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp/View/Screen/dashborad/mainscreen.dart';

class verifyotp extends StatefulWidget {
  final String verificationId;

  verifyotp({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<verifyotp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<verifyotp> {
  bool loading = false;
  final votpController = TextEditingController();
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

                controller: votpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "6 Digit Code",
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(

                onPressed: () async{
                  setState(() {
                    loading = true;
                  });
                  final crendital = PhoneAuthProvider.credential
                    (verificationId: widget.verificationId,
                      smsCode: votpController.text.toString()
                  );
                  try{
                    await auth.signInWithCredential(crendital);

                    Get.to(() => screen());

                  }catch(e){
                    setState(() {
                      loading = false;
                    });

                  }

                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text('Verify',),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
