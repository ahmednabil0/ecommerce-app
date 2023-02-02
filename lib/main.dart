import 'package:ecommerce/helper/theme/theme.dart';
import 'package:ecommerce/views/widgets/aniamated_splash_screan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: getThemeDate(),
      home: const AnimatedScrean(),
    );
  }
}
