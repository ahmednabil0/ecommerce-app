import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/home_view/chechout_veiw.dart/checkout1.dart';
import 'package:ecommerce/views/widgets/small_button.dart';
import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CartViewModel> {
  CartView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(CartViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GetBuilder<CartViewModel>(
              builder: (controller) => controller.cartlist.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/cart.svg',
                          height: Get.width * 250 / 375,
                          width: Get.height * 250 / 812,
                        ),
                        SizedBox(
                          height: Get.height * 14 / 812,
                        ),
                        NewText(
                            txt: 'Empty Cart',
                            colr: primaryColor.withOpacity(0.65),
                            fWeight: FontWeight.bold,
                            fSize: Get.width * 20 / 375)
                      ],
                    )
                  : Column(children: [
                      Expanded(
                          child: SizedBox(
                        child: ListView.builder(
                          itemCount: controller.cartlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 12 / 375),
                              child: InkWell(
                                onLongPress: () {
                                  controller.delte(int.parse(controller
                                      .cartlist[index].id
                                      .toString()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(
                                          Get.width * 5 / 375)),
                                  margin: EdgeInsets.only(
                                      top: Get.width * 12 / 375),
                                  height: Get.height * 120 / 812,
                                  width: Get.width * 345 / 375,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: Get.width * 120 / 375,
                                        height: Get.height * 120 / 812,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                controller.cartlist[index].img),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          NewText(
                                              txt: controller
                                                  .cartlist[index].name,
                                              colr: Colors.grey,
                                              fWeight: FontWeight.normal,
                                              fSize: Get.height * 16 / 812),
                                          NewText(
                                              txt:
                                                  '\$${controller.cartlist[index].price}',
                                              colr: primaryColor,
                                              fWeight: FontWeight.bold,
                                              fSize: Get.height * 16 / 812),
                                          Container(
                                            alignment: Alignment.center,
                                            height: Get.height * 30 / 812,
                                            width: Get.width * 115 / 375,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      controller.add(index);
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      size:
                                                          Get.height * 17 / 812,
                                                    )),
                                                NewText(
                                                    txt:
                                                        '${controller.cartlist[index].count}',
                                                    colr: primaryColor,
                                                    fWeight: FontWeight.normal,
                                                    fSize:
                                                        Get.height * 16 / 812),
                                                IconButton(
                                                    onPressed: () {
                                                      controller.sup(index);
                                                    },
                                                    icon: Icon(Icons.remove,
                                                        size: Get.height *
                                                            17 /
                                                            812)),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                      SizedBox(
                        height: Get.height * 84 / 812,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NewText(
                                    txt: 'TOTAL',
                                    colr: Colors.grey,
                                    fWeight: FontWeight.normal,
                                    fSize: Get.height * 12 / 812),
                                NewText(
                                    txt:
                                        '\$${controller.total.toStringAsFixed(2)}',
                                    colr: primaryColor,
                                    fWeight: FontWeight.bold,
                                    fSize: Get.height * 10 / 375)
                              ],
                            ),
                            AddButton(
                                txt: 'Check Out',
                                ontap: () {
                                  Get.to(() => ChechOut());
                                })
                          ],
                        ),
                      ),
                    ]),
            )));
  }
}
