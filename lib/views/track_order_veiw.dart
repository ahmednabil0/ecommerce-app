import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/helper/helpers/text.dart';
import 'package:ecommerce/view_models/account_veiw_%20model.dart';
import 'package:ecommerce/views/widgets/custombutton.dart';
import 'package:ecommerce/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrderVeiw extends GetWidget<AccountVeiwModel> {
  TrackOrderVeiw({Key? key}) : super(key: key);
  final cont = Get.put(AccountVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: NewText(
            txt: 'Tracking Order',
            colr: fontColor,
            fWeight: FontWeight.bold,
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getOrders();
          },
          child: GetBuilder<AccountVeiwModel>(
            builder: (controller) => controller.orderlist.isEmpty
                ? const Center(
                    child: Text(
                    'NO ORDER YET',
                    style: TextStyle(fontSize: 30),
                  ))
                : ListView.builder(
                    itemCount: controller.orderlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: Get.height * 140 / 812,
                          width: Get.width * 375 / 375,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 15,
                                    color: fontColor.withOpacity(0.1),
                                    offset: const Offset(3.5, 3.5))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: Get.width * 0.35),
                                        NewText(
                                            txt: 'order ${index + 1}',
                                            colr: fontColor,
                                            fWeight: FontWeight.w500,
                                            fSize: Get.height * 18 / 812),
                                      ],
                                    ),
                                    NewText(
                                        txt: cutText2(controller
                                            .orderlist[index].address),
                                        colr: fontColor,
                                        fWeight: FontWeight.normal,
                                        fSize: Get.height * 16 / 812),
                                    NewText(
                                        txt: cutText2(
                                            '\$${controller.orderlist[index].total}'),
                                        colr: primaryColor,
                                        fWeight: FontWeight.bold,
                                        fSize: Get.height * 14 / 812),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: Get.height * 30 / 812),
                                      child: CustomButton(
                                          color: controller
                                                  .orderlist[index].isDelivered
                                              ? primaryColor
                                              : const Color(0xffFFB900),
                                          h: 30,
                                          w: 80,
                                          fontColor: Colors.white,
                                          txt: controller
                                                  .orderlist[index].isDelivered
                                              ? 'Deliverd'
                                              : 'in transit'),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.network(controller.orderlist[index].img)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
