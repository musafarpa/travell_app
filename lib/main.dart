import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travelapp/controller/theme-controller.dart';
import 'package:travelapp/login%20page/auth_page.dart';
import 'View/Screen/dashborad/mainscreen.dart';
import 'login page/login_page.dart';
import 'View/bindings/bindings.dart';
import 'login page/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
    (options: FirebaseOptions
    (
      apiKey: "AIzaSyACI8EOQ_BLbOqW5qhEZ6kIG5WbSw1DGf8",
      appId: "1:106445916909:android:273e27516af189bace5ae4",
      messagingSenderId: "106445916909",
      projectId: "travel-404508",
    storageBucket: "travel-404508.appspot.com"
  )
  );
  if (!kIsWeb) {
    Stripe.publishableKey =
    "pk_test_51OA5tNSJxvrWEbcJNyPCMCzxy3fNjd8tutQxF6C5sQRzhybTmMWeebHkiYjzMDQkrGGOSOWgy6aPRMUSQ32D0Bxg00C4IJBe3J";
  }
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Travel",
        initialBinding: RootBinding(),
        home:Authpage(),
        theme: themeController.currentTheme.value,
      );
    });
  }
}
