import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo/configs/assets.dart';
import 'package:demo/configs/colors.dart';
import 'package:demo/controllers/auth_controller.dart';
import 'package:demo/screens/login_screen.dart';
import 'package:demo/widgets/app_button.dart';
import 'package:demo/widgets/app_circular_overlay_loader.dart';
import 'package:demo/widgets/app_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                    decoration:
                        const BoxDecoration(color: AppColors.primaryColor),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              Assets.leaf,
                              height: 50,
                            ),
                          ),
                        ),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration:
                      const BoxDecoration(color: AppColors.secondaryColor),
                  child: Form(
                    key: globalKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            label: "Name",
                            textEditingController: nameController,
                            suffixIcon: const Icon(Icons.person_outline),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            label: "Email",
                            textEditingController: emailController,
                            suffixIcon: const Icon(Icons.email_outlined),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            label: "Password",
                            suffixIcon: const Icon(Icons.lock_outline),
                            textEditingController: passwordController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            label: "DOB",
                            readOnly: true,
                            textEditingController: dobController,
                            isDate: true,
                            suffixIcon: const Icon(Icons.calendar_month),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            label: "Phone Number",
                            textEditingController: phoneController,
                            suffixIcon: const Icon(Icons.phone_outlined),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            onPressed: () {
                              if (!globalKey.currentState!.validate()) {
                                return;
                              }
                              authController.signup(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  dobController.text,
                                  phoneController.text);

                              // Get.to(() => const OtpScreen());
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.off(() => LoginScreen());
                                },
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: AppColors.primaryDarkColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(() => authController.isLoggingIn.value
              ? const AppOverlayLoader()
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
