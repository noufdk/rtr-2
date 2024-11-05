import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:demo/configs/colors.dart';
import 'package:demo/widgets/app_button.dart';
import 'package:demo/widgets/points_banner.dart';

class RedemptionHistoryScreen extends StatelessWidget {
  const RedemptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PointsBanner(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Redemption History",
                style: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              DataTable(
                horizontalMargin: 5,
                dataRowMaxHeight: 60,
                border: TableBorder.symmetric(
                    inside: const BorderSide(color: Colors.grey)),
                dividerThickness: 0,
                columns: [
                  DataColumn(
                    label:
                        Expanded(child: textItem(title: "Date", divider: true)),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: textItem(title: "Reward", divider: true)),
                  ),
                  DataColumn(
                    label: Expanded(
                        child: textItem(
                            title: "Points\nRedeemed", divider: false)),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        textItem(
                            title: "06/10/2024",
                            style: const TextStyle(color: Colors.grey),
                            divider: true),
                      ),
                      DataCell(
                        textItem(
                            title: "Coffee Voucher",
                            style: const TextStyle(color: Colors.grey),
                            divider: true),
                      ),
                      DataCell(
                        textItem(
                            title: "-300 Points",
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            divider: false),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        textItem(
                            title: "06/10/2024",
                            style: const TextStyle(color: Colors.grey),
                            divider: true),
                      ),
                      DataCell(
                        textItem(
                            title: "Coffee Voucher",
                            style: const TextStyle(color: Colors.grey),
                            divider: true),
                      ),
                      DataCell(
                        textItem(
                            title: "-300 Points",
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            divider: false),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        textItem(
                            title: "06/10/2024",
                            style: const TextStyle(color: Colors.grey),
                            divider: true),
                      ),
                      DataCell(
                        textItem(
                            title: "Coffee Voucher",
                            style: const TextStyle(color: Colors.grey),
                            divider: true),
                      ),
                      DataCell(
                        textItem(
                            title: "-300 Points",
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            divider: false),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.card_giftcard,
                      color: Colors.white,
                    ),
                    title: "Back to Rewards",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      {required String title, TextStyle? style, required bool divider}) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style:
          style ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
