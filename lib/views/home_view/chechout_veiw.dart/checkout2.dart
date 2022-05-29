import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/widgets/small_button.dart';
import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetWidget<CartViewModel> {
  CheckOut({Key? key}) : super(key: key) {
    controller.street1 = controller.st1.text;
    controller.street2 = controller.st2.text;
    controller.city = controller.city1.text;
    controller.state = controller.state1.text;
    controller.country = controller.country1.text;
  }
  @override
  final controller = Get.put(CartViewModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: NewText(
            txt: 'Checkout',
            colr: fontColor,
            fWeight: FontWeight.normal,
            fSize: Get.width * 20 / 375),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: Get.height * 25 / 812,
              color: fontColor,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(Get.height * 10 / 812),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.check_circle,
                      color: primaryColor,
                      size: Get.height * 30 / 812,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.height * 12 / 812),
                    child: NewText(
                        txt: 'Billing address is the same as delivery address',
                        colr: fontColor,
                        fWeight: FontWeight.normal,
                        fSize: Get.height * 14 / 812),
                  )
                ],
              ),
              SizedBox(height: Get.height * 50 / 812),
              SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: Column(
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
                            horizontal: 8.0, vertical: Get.height * 5 / 812),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.st1,
                          onChanged: (value) {
                            controller.street1 = value;
                          },
                          decoration: InputDecoration(
                              hintText: '21, Alex Davidson Avenue',
                              hintStyle:
                                  TextStyle(fontSize: Get.height * 18 / 812),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5)))),
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
                            horizontal: 8.0, vertical: Get.height * 5 / 812),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.st2,
                          onChanged: (value) {
                            controller.street2 = value;
                          },
                          decoration: InputDecoration(
                              hintText: 'Opposite Omegatron, Vicent Quarters',
                              hintStyle:
                                  TextStyle(fontSize: Get.height * 18 / 812),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5)))),
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
                            horizontal: 8.0, vertical: Get.height * 5 / 812),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.city1,
                          onChanged: (value) {
                            controller.city = value;
                          },
                          decoration: InputDecoration(
                              hintText: 'Victoria Island',
                              hintStyle:
                                  TextStyle(fontSize: Get.height * 18 / 812),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5)))),
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
                                  controller: controller.state1,
                                  onChanged: (value) {
                                    controller.state = value;
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
                                  controller: controller.country1,
                                  onChanged: (value) {
                                    controller.country = value;
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
              SizedBox(height: Get.height * 50 / 812),
              Row(
                children: [
                  const Spacer(),
                  AddButton(
                      txt: 'NEXT',
                      ontap: () {
                        if (_key.currentState!.validate()) {
                          controller.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        }
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
