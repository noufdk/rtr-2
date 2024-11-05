import 'package:flutter/material.dart';
import 'package:demo/configs/assets.dart';
import 'package:demo/configs/colors.dart';

class PointsBanner extends StatelessWidget {
  const PointsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  Assets.wallet,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Points balance",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "600",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 36,
          ),
        ],
      ),
    );
  }
}
