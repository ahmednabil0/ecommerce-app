import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control_veiw.dart';

// ignore: must_be_immutable
class AnimatedScrean extends StatelessWidget {
  const AnimatedScrean({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 500,
        splash: SizedBox(
          width: Get.width * 0.75,
          child: Image.asset(
            'assets/images/1.png',
            fit: BoxFit.contain,
          ),
        ),
        // ignore: unnecessary_null_comparison
        nextScreen: ControlVeiw());
  }
}
