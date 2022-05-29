import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignInWithSocial extends StatelessWidget {
  const SignInWithSocial({
    required this.url,
    required this.txt,
    Key? key,
  }) : super(key: key);
  final String url;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20),
      height: Get.height * 0.065,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(url),
          Text(
            txt,
            style: TextStyle(
                fontSize: Get.width * 0.045, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: Get.width * 0.001,
          )
        ],
      ),
    );
  }
}
