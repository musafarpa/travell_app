// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class loginpage1 extends StatefulWidget {
//   const loginpage1({super.key});
//
//   @override
//   State<loginpage1> createState() => _loginpage1State();
// }
//
// class _loginpage1State extends State<loginpage1> {
//   final _formkey = GlobalKey<FormState>();
//   bool isLoading = false;
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   signInWithEmailAndPassword() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _email.text, password: _password.text);
//       setState(() {
//         isLoading = false;
//       });
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       if (e.code == 'user-not-found') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('No user found for that email.'),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Wrong password provided for that user.'),
//           ),
//         );
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   children: [
//                     Image.asset("assets/log.png"),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Welcome home",
//                       style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black54),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Login into your existing account",
//                         style: TextStyle(fontSize: 15),
//
//                       ),
//
//                     ),
//                     SizedBox(height: 22,),
//                     TextFormField(
//                       controller: _email,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//
//                         labelText: "Email",
//                         labelStyle: TextStyle(color: Colors.black),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius:BorderRadius.circular(15) ,
//                           borderSide: BorderSide(color: Colors.black, width: 1),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius:BorderRadius.circular(15) ,
//                           borderSide: BorderSide(color: Colors.black, width: 1),
//                         ),
//
//
//
//                         prefixIcon: Icon(Icons.email,color: Colors.black,),
//                       ),
//                     ),
//
//                     SizedBox(height: 20,),
//
//
//                     TextFormField(
//                       controller: _password,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a valid password';
//                         }
//                         return null;
//                       },
//
//                       obscureText: true,
//                       decoration: InputDecoration(
//
//                           labelText: "Password",
//                           labelStyle: TextStyle(color: Colors.black),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius:BorderRadius.circular(15) ,
//                             borderSide: BorderSide(color: Colors.black, width: 1),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius:BorderRadius.circular(15) ,
//                             borderSide: BorderSide(color: Colors.black, width: 1),
//                           ),
//
//
//
//                           prefixIcon: Icon(Icons.security,color: Colors.black,),
//                           suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black54,)
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 45,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formkey.currentState!.validate()) {
//                             signInWithEmailAndPassword();
//                           }
//                         },
//                         child:isLoading
//                             ? Center(child: CircularProgressIndicator(color: Colors.black,))
//                             : const Text("Login"),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//
//                     GestureDetector(onTap: (){
//                       // Navigator.push(context, MaterialPageRoute(builder: (context) => signin(),),);
//                     },
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding:  EdgeInsets.symmetric(horizontal: 5,vertical: 7),
//                             child: Container(
//                               decoration: BoxDecoration(color: Colors.white,
//                                   borderRadius: BorderRadius.circular(100)),
//
//                               child: Row(
//                                 children: [
//
//                                   Text("Sign up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//             ),
//
//
//
//           )),
//     );
//   }
// }

