import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/view_models/account_veiw_%20model.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/widgets/small_button.dart';
import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressVeiw extends GetWidget<CartViewModel> {
  AdressVeiw({Key? key}) : super(key: key);
  // ignore: unused_field
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final cont = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Get.height * 10 / 812),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 50 / 812),
                SingleChildScrollView(
                  child: Form(
                    child: GetBuilder<CartViewModel>(
                      builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0),
                            child: NewText(
                                txt: 'Street 1',
                                colr: fontColor.withOpacity(0.4),
                                fWeight: FontWeight.normal,
                                fSize: Get.height * 14 / 812),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: Get.height * 5 / 812),
                            child: TextFormField(
                              initialValue: controller.street1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: '21, Alex Davidson Avenue',
                                  hintStyle: TextStyle(
                                      fontSize: Get.height * 18 / 812),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Colors.grey.withOpacity(0.5)))),
                            ),
                          ),
                          SizedBox(height: Get.height * 30 / 812),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0),
                            child: NewText(
                                txt: 'Street 2',
                                colr: fontColor.withOpacity(0.4),
                                fWeight: FontWeight.normal,
                                fSize: Get.height * 14 / 812),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: Get.height * 5 / 812),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText:
                                      'Opposite Omegatron, Vicent Quarters',
                                  hintStyle: TextStyle(
                                      fontSize: Get.height * 18 / 812),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Colors.grey.withOpacity(0.5)))),
                            ),
                          ),
                          SizedBox(height: Get.height * 30 / 812),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0),
                            child: NewText(
                                txt: 'City',
                                colr: fontColor.withOpacity(0.4),
                                fWeight: FontWeight.normal,
                                fSize: Get.height * 14 / 812),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: Get.height * 5 / 812),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'required';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'Victoria Island',
                                  hintStyle: TextStyle(
                                      fontSize: Get.height * 18 / 812),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Colors.grey.withOpacity(0.5)))),
                            ),
                          ),
                          SizedBox(height: Get.height * 30 / 812),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: NewText(
                                        txt: 'State',
                                        colr: fontColor.withOpacity(0.4),
                                        fWeight: FontWeight.normal,
                                        fSize: Get.height * 14 / 812),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: Get.height * 0 / 812),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Lagos State',
                                          hintStyle: TextStyle(
                                              fontSize: Get.height * 18 / 812),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5)))),
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: NewText(
                                        txt: 'Country',
                                        colr: fontColor.withOpacity(0.4),
                                        fWeight: FontWeight.normal,
                                        fSize: Get.height * 14 / 812),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: Get.height * 5 / 812),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'required';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Nigeria',
                                          hintStyle: TextStyle(
                                              fontSize: Get.height * 18 / 812),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5)))),
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 50 / 812),
                Row(
                  children: [
                    const Spacer(),
                    AddButton(txt: 'SAVE', ontap: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
