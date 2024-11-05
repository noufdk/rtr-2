import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riyadh_transportation/configs/assets.dart';
import 'package:riyadh_transportation/configs/colors.dart';
import 'package:riyadh_transportation/controllers/auth_controller.dart';
import 'package:riyadh_transportation/screens/signup_screen.dart';
import 'package:riyadh_transportation/widgets/app_button.dart';
import 'package:riyadh_transportation/widgets/app_circular_overlay_loader.dart';
import 'package:riyadh_transportation/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final globalKey = GlobalKey<State>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                          "Log In",
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
                              height: 80,
                            ),
                            AppTextField(
                              label: "Email",
                              suffixIcon: const Icon(Icons.email_outlined),
                              textEditingController: emailController,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            AppTextField(
                              label: "Password",
                              suffixIcon: const Icon(Icons.lock_outline),
                              textEditingController: passwordController,
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            AppButton(
                              onPressed: () {
                                authController.login(emailController.text,
                                    passwordController.text);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have account? "),
                                GestureDetector(
                                  onTap: () {
                                    Get.off(() => SignUpScreen());
                                  },
                                  child: const Text(
                                    "Sign Up",
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
                  ))
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
