import 'package:ecommerce/view_models/account_veiw_%20model.dart';
import 'package:ecommerce/view_models/auth_view_model.dart';
import 'package:ecommerce/view_models/cart_view_model.dart';
import 'package:ecommerce/view_models/categorie_view_model.dart';
import 'package:ecommerce/view_models/product_categories_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ProductCat());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => AccountVeiwModel());
  }
}
