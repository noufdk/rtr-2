import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riyadh_transportation/configs/assets.dart';
import 'package:riyadh_transportation/screens/login_screen.dart';
import 'package:riyadh_transportation/widgets/app_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Assets.splashBackground,
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.appLogo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            AppButton(
              onPressed: () {
                Get.to(
                  () => LoginScreen(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
