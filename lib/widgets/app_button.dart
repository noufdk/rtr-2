import 'package:flutter/material.dart';
import 'package:riyadh_transportation/configs/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onPressed, this.title, this.icon});

  final VoidCallback onPressed;
  final String? title;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              Text(
                title ?? "Continue",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
