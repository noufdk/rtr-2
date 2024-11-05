import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo/configs/colors.dart';
import 'package:demo/controllers/maps_controller.dart';
import 'package:demo/screens/end_trip_screen.dart';
import 'package:demo/widgets/app_button.dart';
import 'package:demo/widgets/app_circular_overlay_loader.dart';
import 'package:demo/widgets/maps_widget.dart';

class TripConfirmScreen extends StatefulWidget {
  const TripConfirmScreen({super.key});

  @override
  State<TripConfirmScreen> createState() => _TripConfirmScreenState();
}

class _TripConfirmScreenState extends State<TripConfirmScreen> {
  final MapsController mapsController = Get.find<MapsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          height: Get.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total Distance",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(() => Text(
                              mapsController.isLoadingDestination.value
                                  ? "--"
                                  : "${mapsController.travelTime?.rows?[0].elements?[0].distance?.text}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 6,
                  child: Container(
                      padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade100),
                      child: Stack(children: [
                        const MapSample(),
                        Obx(() => mapsController.isLoadingDestination.value
                            ? const AppOverlayLoader()
                            : const SizedBox.shrink())
                      ])),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                    onPressed: () {
                      Get.off(() => const EndTripScreen());
                    },
                    title: "End Trip")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
