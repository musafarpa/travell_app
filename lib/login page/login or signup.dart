import 'package:flutter/cupertino.dart';
import 'package:travelapp/login%20page/login_page.dart';
import 'package:travelapp/login%20page/signup_page.dart';

class loginandsignup extends StatefulWidget {
  const loginandsignup({super.key});

  @override
  State<loginandsignup> createState() => _loginandsignupState();
}

class _loginandsignupState extends State<loginandsignup> {
  bool islogin = true;

  void togglePage() {
    setState(() {
      islogin = !islogin;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return loginpage(
        onPressed: togglePage,
      );
    } else {
      return Signup(
        onPressed: togglePage,
      );
    }
  }
}
