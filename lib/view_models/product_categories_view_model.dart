// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

import '../models/product.dart';

class ProductCat extends GetxController {
  final CollectionReference _ProductsForEachCategorie =
      FirebaseFirestore.instance.collection('products');
  List<Product> ProductsForEachCategorie = [];

  getProductsForEachCategorie(String cat) async {
    if (ProductsForEachCategorie.isNotEmpty) {
      ProductsForEachCategorie.clear();
    }
    await _ProductsForEachCategorie.where('cat', isEqualTo: cat)
        .get()
        .then((value) {
      for (var i in value.docs) {
        ProductsForEachCategorie.add(Product.fromMap(i));
      }
      update();
    });
  }
}
