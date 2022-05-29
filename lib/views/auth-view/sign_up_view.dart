import 'package:ecommerce/views/home_view/home_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/view_models/auth_view_model.dart';
import 'package:ecommerce/views/auth-view/sign_in_view.dart';

import '../widgets/bigbutton.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(AuthViewModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthViewModel>(
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Row(children: [
                IconButton(
                    onPressed: () {
                      Get.to(() => SignInView());
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded))
              ]),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: Get.width * 0.07,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                      ],
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
                              'Name',
                              style: TextStyle(
                                  fontSize: Get.width * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextFormField(
                              controller: nameCont,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                  hintText: 'Name',
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
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
                              validator: (value) {
                                // ignore: unnecessary_null_comparison
                                if (value!.isEmpty || value == null) {
                                  return "please enter the email";
                                }
                                if (!EmailValidator.validate(value)) {
                                  return "enter correct email ";
                                } else {
                                  return null;
                                }
                              },
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
                                if (!RegExp(r'^(?=.*?[0-9]).{8,}$')
                                    .hasMatch(value)) {
                                  return 'week password';
                                }
                                if (value.length > 26) {
                                  return "to big";
                                }
                                return null;
                              }),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.opscur,
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
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            BigButton(
                                txt: 'SIGN Up ',
                                ontap: () async {
                                  if (_key.currentState!.validate()) {
                                    await controller.signUp(emailCont.text,
                                        passCont.text, nameCont.text);
                                    Get.to(const HomeVeiw());
                                  }
                                }),
                            SizedBox(
                              height: Get.height * 0.038,
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
