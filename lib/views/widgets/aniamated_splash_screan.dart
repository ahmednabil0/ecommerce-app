import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/control_veiw.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedScrean extends StatelessWidget {
  const AnimatedScrean({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 1000,
        splash: Image.asset('assets/images/1.png'),
        // ignore: unnecessary_null_comparison
        nextScreen: ControlVeiw());
  }
}
