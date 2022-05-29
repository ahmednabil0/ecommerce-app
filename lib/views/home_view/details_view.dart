import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/models/cart_product_model.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/views/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ecommerce/views/home_view/page_photo.dart';

import '../widgets/text.dart';

class DetailsScrean extends StatefulWidget {
  const DetailsScrean({
    Key? key,
    required this.image,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.price,
    required this.name,
    required this.brand,
    required this.details,
    required this.color,
    required this.sell,
  }) : super(key: key);
  final String image;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final double price;
  final String name;
  final String brand;
  final String details;
  final String color;
  final bool sell;

  @override
  State<DetailsScrean> createState() => _DetailsScreanState();
}

class _DetailsScreanState extends State<DetailsScrean> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => PhotoView(
                        image: widget.image,
                        image2: widget.image2,
                        image3: widget.image3,
                        image4: widget.image4,
                        image5: widget.image5));
                  },
                  child: Hero(
                    tag: 'img',
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/1.png',
                              ),
                              opacity: 0.02),
                        ),
                        height: Get.height * 255 / 812,
                        child: CarouselSlider(
                          items: [
                            Image.network(
                              widget.image,
                              width: double.infinity,
                              height: Get.height * 210 / 812,
                              fit: BoxFit.contain,
                            ),
                            Image.network(
                              widget.image2,
                              width: double.infinity,
                              height: Get.height * 210 / 812,
                              fit: BoxFit.contain,
                            ),
                            Image.network(
                              widget.image3,
                              width: double.infinity,
                              height: Get.height * 210 / 812,
                              fit: BoxFit.contain,
                            ),
                            Image.network(
                              widget.image4,
                              width: double.infinity,
                              height: Get.height * 210 / 812,
                              fit: BoxFit.contain,
                            ),
                            Image.network(
                              widget.image5,
                              width: double.infinity,
                              height: Get.height * 210 / 812,
                              fit: BoxFit.contain,
                            )
                          ],
                          options: CarouselOptions(
                            height: Get.height * 500 / 812,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 2000),
                            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                            onPageChanged: (index, reson) {
                              setState(() {
                                activeIndex = index;
                              });
                            },
                          ),
                        )),
                  ),
                ),
                Positioned(
                    top: Get.height * 240 / 812,
                    left: Get.height * 165 / 812,
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: 5,
                      effect: WormEffect(
                          dotHeight: Get.height * 10 / 812,
                          dotWidth: Get.height * 10 / 812,
                          activeDotColor: primaryColor),
                    )),
                Positioned(
                    top: Get.height * 75 / 812,
                    left: Get.height * 10 / 812,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: Get.height * 30 / 812,
                        ))),
                widget.sell
                    ? Positioned(
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.height * 80 / 812,
                          height: Get.height * 30 / 812,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(Get.height * 12 / 812),
                              ),
                              color: primaryColor.withOpacity(0.5)),
                          child: NewText(
                              txt: 'best Sell',
                              colr: Colors.white,
                              fWeight: FontWeight.w500,
                              fSize: Get.height * 16 / 812),
                        ))
                    : const SizedBox()
              ]),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 30 / 812,
                        vertical: Get.height * 8 / 812),
                    child: Text(widget.name,
                        style: TextStyle(
                            fontSize: Get.height * 26 / 812,
                            color: fontColor,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: Get.height * 90 / 812,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: Get.height * 170 / 812,
                          height: Get.height * 45 / 812,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Get.height * 20 / 812),
                              border: Border.all(
                                  width: 1.5,
                                  color: primaryColor.withOpacity(0.3))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              NewText(
                                txt: 'Size',
                                colr: fontColor,
                                fWeight: FontWeight.bold,
                                fSize: Get.height * 18 / 812,
                              ),
                              NewText(
                                txt: 'XL',
                                colr: fontColor,
                                fWeight: FontWeight.bold,
                                fSize: Get.height * 18 / 812,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: Get.height * 170 / 812,
                          height: Get.height * 45 / 812,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Get.height * 20 / 812),
                              border: Border.all(
                                  width: 1.5,
                                  color: primaryColor.withOpacity(0.3))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              NewText(
                                txt: 'Color',
                                colr: fontColor,
                                fWeight: FontWeight.bold,
                                fSize: Get.height * 18 / 812,
                              ),
                              Container(
                                width: Get.height * 29 / 812,
                                height: Get.height * 29 / 812,
                                decoration: BoxDecoration(
                                    color:
                                        Color(int.parse('0xff${widget.color}')),
                                    borderRadius: BorderRadius.circular(
                                        Get.height * 8 / 812),
                                    border: Border.all(
                                        width: 1.5,
                                        color: primaryColor.withOpacity(0.3))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 30 / 812,
                        vertical: Get.height * 8 / 812),
                    child: Text('Details',
                        style: TextStyle(
                            fontSize: Get.height * 18 / 812,
                            color: fontColor,
                            fontWeight: FontWeight.w800)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.height * 30 / 812,
                        vertical: Get.height * 8 / 812),
                    child: Text(widget.details,
                        style: TextStyle(
                            fontSize: Get.height * 14 / 812,
                            color: fontColor,
                            wordSpacing: 2.9,
                            height: 1.8)),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.height * 30 / 812,
                ),
                color: Colors.white,
                height: Get.height * 85 / 812,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('Price',
                              style: TextStyle(
                                  fontSize: Get.height * 18 / 812,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text('\$ ${widget.price}',
                              style: TextStyle(
                                  fontSize: Get.height * 18 / 812,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        AddButton(
                            txt: 'ADD',
                            ontap: () {
                              final cont = Get.put(CartViewModel());
                              cont.addToCart(Cartproducts(
                                  name: widget.name,
                                  price: widget.price,
                                  count: 1,
                                  img: widget.image));
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
