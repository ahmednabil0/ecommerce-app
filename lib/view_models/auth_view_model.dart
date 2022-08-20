import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/views/home_view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  CollectionReference reff = FirebaseFirestore.instance.collection('users');
  bool opscur = true;
  void isops() {
    opscur = !opscur;
    update();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // sign in
  Future<void> signUp(String email, String password, String name) async {
    var results = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    // ignore: unnecessary_null_comparison
    if (results != null) {
      reff.doc().set(
          {'email': email, 'name': name, 'uid': firebaseAuth.currentUser!.uid});
      Get.snackbar('Ok', 'sucess Sign Up');
      Get.to(() => const HomeVeiw());
    }
  }

  // sign up
  Future<void> signIn(String email, String password) async {
    try {
      // ignore: unused_local_variable
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        Get.snackbar('Ok', 'sucess Sign in');
        Get.to(() => const HomeVeiw());
      }
      // ignore: unnecessary_null_comparison

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('erreo', 'user not found');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('error', 'wrong password');
      }
    }

    // ignore: unnecessary_null_comparison
  }

// sign in with goegle

}
