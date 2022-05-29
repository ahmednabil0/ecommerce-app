import 'package:ecommerce/helper/helpers/conest.dart';
import 'package:ecommerce/view_models/categorie_view_model.dart';
import 'package:ecommerce/views/auth-view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view_models/auth_view_model.dart';
import '../widgets/bigbutton.dart';
import '../widgets/sign_in_with_social.dart';

// ignore: must_be_immutable
class SignInView extends GetWidget<AuthViewModel> {
  SignInView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  HomeViewModel cata = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    Get.put(AuthViewModel());
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'welcome,',
                            style: TextStyle(
                                fontSize: Get.width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Get.to(() => SignUpView());
                            },
                            child: Text('Sign Up',
                                style: TextStyle(
                                    fontSize: Get.width * 0.048,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor)),
                          )
                        ],
                      ),
                      Text(
                        'sign in to continue',
                        style: TextStyle(
                            color: fontColor.withOpacity(0.3),
                            fontSize: Get.width * 0.032,
                            fontWeight: FontWeight.w500),
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextFormField(
                                controller: emailCont,
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter email";
                                  }

                                  return null;
                                }),
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    hintText: 'examble@gmail.com',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Text(
                                'password',
                                style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextFormField(
                                controller: passCont,
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter password";
                                  }

                                  return null;
                                }),
                                obscureText: controller.opscur,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.isops();
                                        },
                                        icon: Icon(controller.opscur
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined)),
                                    hintText: 'password',
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w500)),
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      'forget password?',
                                      style: TextStyle(
                                          fontSize: Get.width * 0.04,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              BigButton(
                                  txt: 'SIGN IN ',
                                  ontap: () async {
                                    if (_key.currentState!.validate()) {
                                      await controller.signIn(
                                          emailCont.text, passCont.text);
                                    }
                                  }),
                              SizedBox(
                                height: Get.height * 0.038,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '_OR_',
                    style: TextStyle(
                        fontSize: Get.width * 0.045,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const InkWell(
                  child: SignInWithSocial(
                      url: 'assets/svg/facebook.svg',
                      txt: 'sign with facebook'),
                ),
                const InkWell(
                  child: SignInWithSocial(
                      url: 'assets/svg/goegle.svg', txt: 'sign with goegle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
