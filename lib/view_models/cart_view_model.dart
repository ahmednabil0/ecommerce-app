// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/helpers/db_helper.dart';
import 'package:ecommerce/models/cart_product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CollectionReference ref = FirebaseFirestore.instance.collection('orders');
  PageController pageController = PageController();
  bool isSaved = false;

  String street1 = '';
  String street2 = '';
  String city = '';
  String state = '';
  String country = '';
  TextEditingController st1 = TextEditingController();
  TextEditingController st2 = TextEditingController();
  TextEditingController city1 = TextEditingController();
  TextEditingController state1 = TextEditingController();
  TextEditingController country1 = TextEditingController();

  List<Cartproducts> cartlist = [];
  late DbHelper dbHelper;
  double total = 0;
  @override
  void onInit() {
    dbHelper = DbHelper();
    dbHelper.createDatabase();
    getAllToCArt();
    update();
    super.onInit();
  }

  void saveAddress() {
    isSaved = true;
    update();
  }

  Future<void> addToCart(Cartproducts cartproducts) async {
    await dbHelper.createproduct(cartproducts);
    getAllToCArt();
  }

  Future<void> getAllToCArt() async {
    cartlist.clear();
    dbHelper.getAllProducts().then((value) {
      for (var i in value) {
        cartlist.add(Cartproducts.fromMap(i));
      }
      calTotal();
      if (cartlist.isEmpty) {
        total = 0;
      }
      update();
    });
  }

  Future<void> delte(int id) async {
    dbHelper.delete(id);
    getAllToCArt();
    update();
  }

  double calTotal() {
    dbHelper.getAllProducts().then((value) {
      total = 0;
      for (var i in value) {
        total = total +
            (double.parse(i['price'].toString())) *
                double.parse(i['count'].toString());
      }
      // if (total < 0) {
      //   total = 0.00;
      // }
    });
    update();
    return total;
  }

  void add(int index) {
    cartlist[index].count++;
    dbHelper.update(cartlist[index]).then((value) {
      calTotal();
      update();
    });
  }

  void sup(int index) {
    cartlist[index].count--;
    if (cartlist[index].count <= 0) {
      cartlist[index].count = 1;
    }
    dbHelper.update(cartlist[index]).then((value) {
      calTotal();
      update();
    });
  }

  void sendOrders() {
    List<Map> list = [];
    for (var i in cartlist) {
      list.add(i.toMap());
    }
    ref.doc().set({
      'addres': '${country} ,${state} ,${city} ,${street1} ,${street2}',
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'order': list,
      'isDelivred': false,
      'total': total
    }).then((value) async {
      await Future.delayed(const Duration(milliseconds: 200));
      Get.back();
      Get.snackbar('scuess', 'YOUR ORDER IN DELIVER');
      dbHelper.clear();
      cartlist.clear();
      st1.clear();
      st2.clear();
      state1.clear();
      city1.clear();
      country1.clear();

      update();
    });
  }
}
