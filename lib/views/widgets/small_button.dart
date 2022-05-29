import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.txt, required this.ontap})
      : super(key: key);
  final String txt;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        height: Get.height * 50 / 812,
        width: Get.height * 145 / 812,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(4)),
        child: Text(
          txt,
          style: TextStyle(
              color: backgroundColor,
              fontSize: Get.width * 0.045,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
