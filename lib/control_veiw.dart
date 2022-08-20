import 'package:ecommerce/view_models/auth_view_model.dart';
import 'package:ecommerce/views/auth-view/sign_in_view.dart';
import 'package:ecommerce/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlVeiw extends GetWidget<AuthViewModel> {
  ControlVeiw({Key? key}) : super(key: key);
  final cont = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? SignInView()
          : const HomeVeiw();
    });
  }
}
