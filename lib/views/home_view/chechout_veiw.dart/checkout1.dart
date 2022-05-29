import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/home_view/chechout_veiw.dart/checkout2.dart';
import 'package:ecommerce/views/home_view/chechout_veiw.dart/summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChechOut extends GetWidget<CartViewModel> {
  ChechOut({Key? key}) : super(key: key);

  @override
  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [CheckOut(), Summary()],
      ),
    );
  }
}
