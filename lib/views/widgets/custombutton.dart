import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.color,
    required this.h,
    required this.w,
    required this.fontColor,
    required this.txt,
  }) : super(key: key);
  int h;
  int w;
  String txt;
  Color color;
  Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height * h / 812,
      width: Get.width * w / 375,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: NewText(
          txt: txt,
          colr: fontColor,
          fWeight: FontWeight.normal,
          fSize: Get.height * 18 / 812),
    );
  }
}
