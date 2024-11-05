import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:riyadh_transportation/configs/assets.dart';
import 'package:riyadh_transportation/configs/colors.dart';
import 'package:riyadh_transportation/widgets/app_button.dart';

class EndTripScreen extends StatefulWidget {
  const EndTripScreen({super.key});

  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {
  double value = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Lottie.asset(Assets.successAnimation, height: 150, width: 150),
              const Text(
                "End Trip Successfully",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Trip Summary",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5)),
                child: const Column(
                  children: [
                    RowItem(
                      title: "Starting Location",
                      trailing: "Home",
                    ),
                    Divider(),
                    RowItem(
                      title: "Ending Location",
                      trailing: "Work",
                    ),
                    Divider(),
                    RowItem(
                      title: "Duration",
                      trailing: "10 min",
                    ),
                    Divider(),
                    RowItem(
                      title: "Distance",
                      trailing: "5 KM",
                    ),
                    Divider(),
                    RowItem(
                      title: "Points Earned",
                      trailing: "40 Points",
                      color: AppColors.primaryDarkColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("How was your experience?"),
              const SizedBox(
                height: 10,
              ),
              RatingStars(
                value: value,
                valueLabelVisibility: false,
                starColor: Colors.amber,
                onValueChanged: (v) {
                  //
                  setState(() {
                    value = v;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: "Back to Home",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem(
      {super.key, required this.title, required this.trailing, this.color});

  final String title;
  final String trailing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            trailing,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: color ?? Colors.black),
          )
        ],
      ),
    );
  }
}
