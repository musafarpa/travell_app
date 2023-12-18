import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/View/Screen/dashborad/mainscreen.dart';
import 'package:travelapp/controller/theme-controller.dart';

import 'authservicr.dart';

class Signup extends StatefulWidget {
  final void Function()? onPressed;
  const Signup({super.key,required this.onPressed});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
final authcontroller= Get.put(AuthService());
  // createUserWithEmailAndPassword() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _email.text,
  //         password: _password.text
  //     );
  //     setState(() {
  //       isLoading = false;
  //     });
  //
  //     Get.to(()=>screen());
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (e.code == 'weak-password') {
  //
  //       return ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content:Text("The password")
  //           )
  //       );
  //
  //
  //     } else if (e.code == 'email-already-in-use') {
  //       return ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content:Text("The account already exi")
  //       )
  //       );
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print(e);
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: OverflowBar(
              overflowSpacing: 20,
              children: [
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        // createUserWithEmailAndPassword();
                        authcontroller.signUpWithEmailAndPassword(_email.text, _password.text);
                      }
                    },
                    child:isLoading
                        ? Center(child: CircularProgressIndicator(color: Colors.black,))
                        :const Text("Signup"),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
