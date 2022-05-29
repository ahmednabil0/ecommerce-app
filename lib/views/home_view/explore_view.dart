import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/helper/helpers/text.dart';
import 'package:ecommerce/view_models/categorie_view_model.dart';
import 'package:ecommerce/views/home_view/categories.dart';
import 'package:ecommerce/views/home_view/details_view.dart';
import 'package:ecommerce/views/home_view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text.dart';

class ExploreView extends GetWidget<HomeViewModel> {
  ExploreView({Key? key}) : super(key: key);
  final cont = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.5),
          child: Image.asset(
            'assets/images/1.png',
            height: Get.height * 100 / 812,
            width: Get.height * 50 / 812,
            fit: BoxFit.fill,
          ),
        ),
        leadingWidth: Get.height * 120 / 812,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                      size: Get.height * 38 / 812,
                    )),
                Positioned(
                  top: Get.height * 6 / 812,
                  left: Get.height * 30 / 812,
                  child: Container(
                    height: Get.height * 20 / 812,
                    width: Get.height * 20 / 812,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.all(Get.height * 10 / 812),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Get.height * 13 / 812),
                child: InkWell(
                  onTap: () => Get.to(() => const SearchView()),
                  child: Container(
                    margin: EdgeInsets.only(top: Get.height * 5 / 812),
                    alignment: Alignment.centerLeft,
                    height: Get.height * 55 / 812,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Get.height * 45 / 812),
                        color: primaryColor.withOpacity(0.13)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 10.0 / 812,
                          horizontal: Get.height * 10.0 / 812),
                      child: Icon(
                        Icons.search_rounded,
                        size: Get.height * 40 / 812,
                        color: fontColor.withOpacity(0.42),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height * 20 / 812, horizontal: 10.0),
                child: Text('Categories',
                    style: TextStyle(
                        fontSize: Get.height * 18 / 812,
                        color: fontColor,
                        fontWeight: FontWeight.w800)),
              ),
              GetBuilder<HomeViewModel>(
                builder: (controller) => SizedBox(
                  height: Get.height * 120 / 812,
                  child: controller.categ.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categ.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => CategorieView(
                                    name: controller.categ[index].name));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 10 / 812,
                                        horizontal: Get.height * 10 / 812),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: Get.height * 10 / 812),
                                      height: Get.height * 60 / 812,
                                      width: Get.height * 60 / 812,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                              opacity: 0.05,
                                              image: AssetImage(
                                                  'assets/images/1.png'))),
                                      child: FadeInImage(
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: primaryColor,
                                            ));
                                          },
                                          placeholder: const AssetImage(
                                              'assets/images/1.png'),
                                          image: NetworkImage(
                                              controller.categ[index].image)),
                                    ),
                                  ),
                                  Text(controller.categ[index].name,
                                      style: TextStyle(
                                        fontSize: Get.height * 14.5 / 812,
                                        color: fontColor,
                                      ))
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
              SizedBox(height: Get.height * 30 / 812),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Poubler Products',
                        style: TextStyle(
                            fontSize: Get.height * 19.5 / 812,
                            color: fontColor,
                            fontWeight: FontWeight.w700)),
                    const Spacer(),
                    Text('see all',
                        style: TextStyle(
                            fontSize: Get.height * 19 / 812,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              SizedBox(
                  height: Get.height * 320 / 812,
                  child: GetBuilder<HomeViewModel>(
                    builder: (controller) => controller.product.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.product.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.height * 15 / 812),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => DetailsScrean(
                                          image:
                                              controller.product[index].image,
                                          image2:
                                              controller.product[index].image2,
                                          image3:
                                              controller.product[index].image3,
                                          image4:
                                              controller.product[index].image4,
                                          image5:
                                              controller.product[index].image5,
                                          price: double.parse(
                                              controller.product[index].price),
                                          name: controller.product[index].name,
                                          brand:
                                              controller.product[index].brand,
                                          details:
                                              controller.product[index].details,
                                          color:
                                              controller.product[index].color,
                                          sell: controller
                                              .product[index].bestsell,
                                        ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        Container(
                                          height: Get.height * 240 / 812,
                                          width: Get.height * 170 / 812,
                                          decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                  opacity: 0.05,
                                                  image: AssetImage(
                                                      'assets/images/1.png')),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: FadeInImage(
                                              height: Get.height * 240 / 812,
                                              width: Get.height * 180 / 812,
                                              fit: BoxFit.contain,
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  color: primaryColor,
                                                ));
                                              },
                                              placeholder: const AssetImage(
                                                  'assets/images/1.png'),
                                              image: NetworkImage(
                                                controller.product[index].image,
                                              )),
                                        ),
                                        controller.product[index].bestsell
                                            ? Positioned(
                                                child: Container(
                                                alignment: Alignment.center,
                                                width: Get.height * 80 / 812,
                                                height: Get.height * 30 / 812,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .only(
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
                                                        .withOpacity(0.5)),
                                                child: NewText(
                                                    txt: 'best Sell',
                                                    colr: Colors.white,
                                                    fWeight: FontWeight.w500,
                                                    fSize:
                                                        Get.height * 16 / 812),
                                              ))
                                            : const SizedBox()
                                      ]),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                            cutText4(
                                                controller.product[index].name),
                                            style: TextStyle(
                                                fontSize: Get.height * 18 / 812,
                                                color: fontColor,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 0.0),
                                        child: Text(
                                            controller.product[index].brand,
                                            style: TextStyle(
                                                fontSize: Get.height * 18 / 812,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                            '\$ ${controller.product[index].price}',
                                            style: TextStyle(
                                                fontSize: Get.height * 18 / 812,
                                                color: primaryColor,
                                                fontWeight: FontWeight.w700)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
