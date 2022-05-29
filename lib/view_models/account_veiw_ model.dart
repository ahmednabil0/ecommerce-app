// ignore_for_file: file_names
import 'package:ecommerce/models/order_model.dart';
import 'package:ecommerce/views/auth-view/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountVeiwModel extends GetxController {
  late String email;
  late String name;
  List<OrdereModel> orderlist = [];
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');

  // ignore: non_constant_identifier_names
  Future<void> GetUserInfo() async {
    await ref
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      email = value.docs[0]['email'];
      name = value.docs[0]['name'];
    });
  }

  Future<void> getOrders() async {
    orderlist.clear();
    await orderRef
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      for (var i in value.docs) {
        orderlist.add(OrdereModel(
            address: i['addres'],
            img: i['order'][0]['img'],
            total: i['total'],
            isDelivered: i['isDelivred']));
      }
    }).whenComplete(() {
      update();
    });
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.snackbar('LOG OUT', "");
    Get.to(() => SignInView());
  }

  

  @override
  void onInit() async {
    await GetUserInfo();
    await getOrders();
    super.onInit();
  }
}
