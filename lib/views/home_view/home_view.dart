import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/views/home_view/account_view.dart';
import 'package:ecommerce/views/home_view/cart_view.dart';
import 'package:ecommerce/views/home_view/explore_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeVeiw extends StatefulWidget {
  const HomeVeiw({Key? key}) : super(key: key);

  @override
  State<HomeVeiw> createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  int currenntIndex = 0;
  List<Widget> bodyList = [ExploreView(), CartView(), AccountView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyList[currenntIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(15))),
        padding: EdgeInsets.all(Get.width * .02),
        child: GNav(
            textStyle:
                TextStyle(fontSize: Get.width * .04, color: primaryColor),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            hoverColor: primaryColor,
            curve: Curves.easeInToLinear,
            duration: const Duration(milliseconds: 200),
            color: Colors.grey.shade500,
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 4 / 812,
                horizontal: Get.height * 4 / 812),
            tabActiveBorder: const Border(
                top: BorderSide(color: primaryColor, width: 2.3),
                bottom: BorderSide(color: primaryColor, width: 2.3),
                right: BorderSide(color: primaryColor, width: 2.3),
                left: BorderSide(color: primaryColor, width: 2.3)),
            iconSize: Get.width * 0.07,
            activeColor: primaryColor,
            gap: 8,
            tabBorderRadius: Get.height * 18.5 / 812,
            selectedIndex: currenntIndex,
            onTabChange: (index) {
              setState(() {
                currenntIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Account',
              )
            ]),
      ),
    );
  }
}
