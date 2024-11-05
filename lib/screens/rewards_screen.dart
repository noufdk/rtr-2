import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo/configs/colors.dart';
import 'package:demo/screens/redemption_history_screen.dart';
import 'package:demo/widgets/points_banner.dart';
import 'package:demo/widgets/rewards_item.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PointsBanner(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Select Reward to Redeem",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDarkColor,
                fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) => RewardsItem(
                  flag: true,
                  title: "Coffee Voucher",
                  totalPoints: 1000,
                  points: 200),
            ),
          ),
          TextButton(
              onPressed: () {
                Get.to(() => const RedemptionHistoryScreen());
              },
              child: const Text("Redemption History"))
        ],
      ),
    );
  }
}
