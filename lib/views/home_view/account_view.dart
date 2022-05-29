import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/view_models/account_veiw_%20model.dart';
import 'package:ecommerce/views/adreass_view.dart';
import 'package:ecommerce/views/track_order_veiw.dart';
import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends GetWidget<AccountVeiwModel> {
  AccountView({Key? key}) : super(key: key);
  final cont = Get.put(AccountVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.height * 20 / 812),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: Get.height * 40 / 812),
                child: Row(
                  children: [
                    Container(
                        width: Get.width * 120 / 375,
                        height: Get.height * 120 / 812,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.person,
                          size: Get.height * 80 / 812,
                          color: primaryColor,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.height * 40 / 812),
                      child: GetBuilder<AccountVeiwModel>(
                        // ignore: unnecessary_null_comparison
                        builder: (controller) => controller.name == null
                            ? const CircularProgressIndicator()
                            : Column(
                                children: [
                                  NewText(
                                      txt: controller.name,
                                      colr: fontColor,
                                      fWeight: FontWeight.w500,
                                      fSize: Get.height * 26 / 812),
                                  NewText(
                                      txt: controller.email,
                                      colr: fontColor,
                                      fWeight: FontWeight.normal,
                                      fSize: Get.height * 14 / 812),
                                ],
                              ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: Get.height * 400 / 812,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Icon_History.png',
                          height: Get.width * 45 / 375,
                          width: Get.width * 45 / 375,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 15 / 812),
                          child: NewText(
                              txt: 'tarcking order',
                              colr: fontColor,
                              fWeight: FontWeight.normal,
                              fSize: Get.height * 18 / 812),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Get.to(() => TrackOrderVeiw());
                            },
                            icon: Icon(
                              Icons.chevron_right_rounded,
                              size: Get.width * 30 / 375,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Icon_Alert.png',
                          height: Get.width * 45 / 375,
                          width: Get.width * 45 / 375,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 15 / 812),
                          child: NewText(
                              txt: 'Notifications',
                              colr: fontColor,
                              fWeight: FontWeight.normal,
                              fSize: Get.height * 18 / 812),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right_rounded,
                              size: Get.width * 30 / 375,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Icon_Edit-Profile.png',
                          height: Get.width * 45 / 375,
                          width: Get.width * 45 / 375,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 15 / 812),
                          child: NewText(
                              txt: 'Edit Profile',
                              colr: fontColor,
                              fWeight: FontWeight.normal,
                              fSize: Get.height * 18 / 812),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right_rounded,
                              size: Get.width * 30 / 375,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Icon_Payment.png',
                          height: Get.width * 45 / 375,
                          width: Get.width * 45 / 375,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 15 / 812),
                          child: NewText(
                              txt: 'Cards',
                              colr: fontColor,
                              fWeight: FontWeight.normal,
                              fSize: Get.height * 18 / 812),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right_rounded,
                              size: Get.width * 30 / 375,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Icon_Location.png',
                          height: Get.width * 45 / 375,
                          width: Get.width * 45 / 375,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.height * 15 / 812),
                          child: NewText(
                              txt: 'Shippping address',
                              colr: fontColor,
                              fWeight: FontWeight.normal,
                              fSize: Get.height * 18 / 812),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Get.to(() => AdressVeiw());
                            },
                            icon: Icon(
                              Icons.chevron_right_rounded,
                              size: Get.width * 30 / 375,
                            ))
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.logOut();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Icon_Exit.png',
                            height: Get.width * 45 / 375,
                            width: Get.width * 45 / 375,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.height * 15 / 812),
                            child: NewText(
                                txt: 'log Out',
                                colr: fontColor,
                                fWeight: FontWeight.normal,
                                fSize: Get.height * 18 / 812),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
