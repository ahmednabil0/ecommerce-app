import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({
    Key? key,
    required this.image,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
  }) : super(key: key);
  final String image;
  final String image2;
  final String image3;
  final String image4;
  final String image5;

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  int eindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fontColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 80 / 812,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.height * 18 / 812),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    )),
                Text('5/$eindex',
                    style: TextStyle(
                        fontSize: Get.height * 18 / 812,
                        color: Colors.white,
                        fontWeight: FontWeight.w800))
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 80 / 812,
          ),
          Center(
            child: Hero(
              tag: 'img',
              child: Container(
                height: Get.height * 417 / 812,
                decoration: const BoxDecoration(color: Colors.white),
                width: double.infinity,
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
                    height: Get.height * 450 / 812,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 2000),
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    onPageChanged: (index, reson) {
                      setState(() {
                        eindex = index + 1;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
