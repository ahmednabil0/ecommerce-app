// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/product.dart';
import 'package:get/state_manager.dart';

// ignore: camel_case_types
class HomeViewModel extends GetxController {
  final CollectionReference _categoreie =
      FirebaseFirestore.instance.collection('categories');
  List<Category> categ = [];
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  List<Product> product = [];

  getCatogries() async {
    await _categoreie.get().then((value) {
      for (var i in value.docs) {
        categ.add(Category.fromMap(i));
      }
      update();
    });
  }

  getProducts() async {
    await _products.where('mostsell', isEqualTo: true).get().then((value) {
      for (var i in value.docs) {
        product.add(Product.fromMap(i));
      }
    });
    update();
  }

  @override
  void onInit() {
    getCatogries();
    getProducts();
    super.onInit();
  }
}
