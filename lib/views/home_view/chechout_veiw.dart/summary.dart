import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/helper/helpers/text.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends GetWidget<CartViewModel> {
  Summary({Key? key}) : super(key: key);
  final cont = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: NewText(
            txt: 'Summary',
            colr: fontColor,
            fWeight: FontWeight.normal,
            fSize: Get.width * 20 / 375),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              controller.pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.easeInToLinear);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: Get.height * 25 / 812,
              color: fontColor,
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(Get.height * 15 / 812),
        height: double.infinity,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: Get.height * 10 / 812),
          SizedBox(
            height: Get.height * 220 / 812,
            width: Get.width,
            child: GetBuilder<CartViewModel>(
              builder: (controller) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.cartlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          controller.cartlist[index].img,
                          height: Get.height * 150 / 812,
                          width: Get.height * 120 / 812,
                        ),
                        NewText(
                            txt: cutText(controller.cartlist[index].name),
                            colr: fontColor,
                            fWeight: FontWeight.normal,
                            fSize: Get.height * 16 / 812),
                        NewText(
                            txt: '${controller.cartlist[index].price}',
                            colr: primaryColor,
                            fWeight: FontWeight.normal,
                            fSize: Get.height * 16 / 812)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 0.2,
          ),
          NewText(
              txt: 'Shipping Address',
              colr: fontColor,
              fWeight: FontWeight.bold,
              fSize: Get.height * 18 / 812),
          SizedBox(height: Get.height * 18 / 812),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: Get.width * 290 / 375,
                  child: Text(
                      '${controller.street1} , ${controller.street2} , ${controller.city} , ${controller.state} , ${controller.country}',
                      style: TextStyle(
                          fontSize: Get.height * 18 / 812,
                          height: 1.35,
                          fontWeight: FontWeight.w300))),
              Icon(
                Icons.check_circle,
                color: primaryColor,
                size: Get.height * 30 / 812,
              )
            ],
          ),
          const Divider(
            height: 20,
          ),
          SizedBox(
            height: Get.height * 150 / 812,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: NewText(
                      txt: 'DETAILS',
                      colr: fontColor,
                      fWeight: FontWeight.bold,
                      fSize: Get.height * 20 / 812),
                ),
                Row(
                  children: [
                    NewText(
                        txt: 'name',
                        colr: fontColor,
                        fWeight: FontWeight.w500,
                        fSize: Get.height * 19 / 812),
                    const Spacer(),
                    NewText(
                        txt: 'price * count',
                        colr: fontColor,
                        fWeight: FontWeight.w500,
                        fSize: Get.height * 19 / 812)
                  ],
                ),
                Expanded(
                  child: GetBuilder<CartViewModel>(
                    builder: (controller) => ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.cartlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            NewText(
                                txt: cutText(controller.cartlist[index].name),
                                colr: fontColor.withOpacity(0.5),
                                fWeight: FontWeight.normal,
                                fSize: Get.height * 18 / 812),
                            const Spacer(),
                            NewText(
                                txt:
                                    '${controller.cartlist[index].price} * ${controller.cartlist[index].count}',
                                colr: fontColor.withOpacity(0.5),
                                fWeight: FontWeight.normal,
                                fSize: Get.height * 18 / 812),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewText(
                  txt: 'TOTAL',
                  colr: fontColor,
                  fWeight: FontWeight.bold,
                  fSize: Get.height * 18 / 812),
              NewText(
                  txt: controller.total.toString(),
                  colr: primaryColor,
                  fWeight: FontWeight.bold,
                  fSize: Get.height * 18 / 812),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  controller.pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInToLinear);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Get.height * 50 / 812,
                  width: Get.width * 120 / 375,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryColor, width: 2)),
                  child: NewText(
                      txt: 'BACK',
                      colr: fontColor,
                      fWeight: FontWeight.normal,
                      fSize: Get.height * 18 / 812),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.sendOrders();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Get.height * 50 / 812,
                  width: Get.width * 120 / 375,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor),
                  child: NewText(
                      txt: 'Deliver',
                      colr: Colors.white,
                      fWeight: FontWeight.normal,
                      fSize: Get.height * 18 / 812),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
