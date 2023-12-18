import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/controller/theme-controller.dart';
import 'package:travelapp/login%20page/phone/login_otp.dart';
import 'package:travelapp/login%20page/signup_page.dart';

class loginpage extends StatefulWidget {
  final void Function()? onPressed;
  const loginpage({super.key,required this.onPressed});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _isMounted = false; // Add this flag

  @override
  void initState() {
    super.initState();
    _isMounted = true;
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  signInWithEmailAndPassword() async {
    try {
      if (_isMounted) {
        setState(() {
          isLoading = true;
        });
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      if (_isMounted) {
        setState(() {
          isLoading = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (_isMounted) {
        setState(() {
          isLoading = false;
        });
      }
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 250,right: 20,left: 20,bottom: 0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  OverflowBar(

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
                              signInWithEmailAndPassword();
                              // widget.onPressed!();
                            }
                          },
                          child:isLoading
                              ? Center(child: CircularProgressIndicator(color: Colors.black,))
                              : const Text("Login"),
                        ),
                      ),
                      SizedBox(
                        height: 40,

                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Text("Dont have an account?",style: GoogleFonts.poppins(fontSize: 15),),
                              TextButton(onPressed: (){
                           Get.to(Signup(onPressed: () {
                             return ;
                           },)) ;
                              },
                                child: Text("Sign Up",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),),
                              ),

                            ],
                          ),
                      ),
                      SizedBox(height:10,),





                    ],

                  ),
                  InkWell(
                    onTap: () {
                      Get.to(loginotp());
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text("Login With Phone")),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
