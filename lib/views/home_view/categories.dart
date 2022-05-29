import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/helper/helpers/text.dart';
import 'package:ecommerce/view_models/product_categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text.dart';
import 'details_view.dart';

class CategorieView extends GetWidget<ProductCat> {
  CategorieView({required this.name, Key? key}) : super(key: key) {
    cont.getProductsForEachCategorie(name);
  }
  final cont = Get.put(ProductCat());

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductCat>(
          builder: (controller) => SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: Get.height * 30 / 812,
                        )),
                    SizedBox(
                      width: Get.height * 120 / 812,
                    ),
                    Text(name,
                        style: TextStyle(
                            fontSize: Get.height * 19.5 / 812,
                            color: fontColor,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                Expanded(
                    child: SizedBox(
                        child: controller.ProductsForEachCategorie.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: Get.height * 340 / 812,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: Get.height * 1 / 812),
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    controller.ProductsForEachCategorie.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.height * 30 / 812),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => DetailsScrean(
                                                image: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .image,
                                                image2: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .image2,
                                                image3: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .image3,
                                                image4: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .image4,
                                                image5: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .image5,
                                                price: double.parse(controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .price),
                                                name: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .name,
                                                brand: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .brand,
                                                details: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .details,
                                                color: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .color,
                                                sell: controller
                                                    .ProductsForEachCategorie[
                                                        index]
                                                    .bestsell,
                                              ));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height:
                                                      Get.height * 240 / 812,
                                                  width: Get.height * 180 / 812,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Image.network(
                                                    controller
                                                        .ProductsForEachCategorie[
                                                            index]
                                                        .image,
                                                    height:
                                                        Get.height * 240 / 812,
                                                    width:
                                                        Get.height * 180 / 812,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                controller
                                                        .ProductsForEachCategorie[
                                                            index]
                                                        .bestsell
                                                    ? Positioned(
                                                        child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: Get.height *
                                                            80 /
                                                            812,
                                                        height: Get.height *
                                                            30 /
                                                            812,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        Get.height *
                                                                            12 /
                                                                            812),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        Get.height *
                                                                            12 /
                                                                            812)),
                                                            color: primaryColor
                                                                .withOpacity(
                                                                    0.5)),
                                                        child: NewText(
                                                            txt: 'best Sell',
                                                            colr: Colors.white,
                                                            fWeight:
                                                                FontWeight.w500,
                                                            fSize: Get.height *
                                                                16 /
                                                                812),
                                                      ))
                                                    : const SizedBox()
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                  cutText3(controller
                                                      .ProductsForEachCategorie[
                                                          index]
                                                      .name),
                                                  style: TextStyle(
                                                      fontSize:
                                                          Get.height * 18 / 812,
                                                      color: fontColor,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                  controller
                                                      .ProductsForEachCategorie[
                                                          index]
                                                      .brand,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Get.height * 18 / 812,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Text(
                                                  '\$ ${controller.ProductsForEachCategorie[index].price}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          Get.height * 18 / 812,
                                                      color: primaryColor,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
