import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riyadh_transportation/configs/assets.dart';
import 'package:riyadh_transportation/configs/colors.dart';

class RewardsItem extends StatefulWidget {
  const RewardsItem({
    super.key,
    required this.flag,
    required this.title,
    required this.totalPoints,
    required this.points,
  });

  final String title;
  final double points;
  final double totalPoints;
  final bool flag;

  @override
  State<RewardsItem> createState() => _RewardsItemState();
}

class _RewardsItemState extends State<RewardsItem> {
  final double width = Get.width * 0.6;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(7),
                border:
                    Border.all(width: 1, color: AppColors.primaryDarkColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: widget.points.toStringAsFixed(0),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: " Points needed",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ]),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.check,
                      color: AppColors.primaryDarkColor,
                      size: 30,
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.secondaryColor),
                    ),
                    Container(
                      width: width * (widget.points / widget.totalPoints),
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.primaryDarkColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          isExpanded
              ? Container(
                  height: 80,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.primaryLightColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          width: 1, color: AppColors.primaryDarkColor)),
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 20),
                    itemBuilder: (context, index) => Text("• item $index"),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
