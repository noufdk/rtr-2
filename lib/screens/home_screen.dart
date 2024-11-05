import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:demo/configs/colors.dart';
import 'package:demo/controllers/auth_controller.dart';
import 'package:demo/controllers/maps_controller.dart';
import 'package:demo/screens/trip_confirm_screen.dart';
import 'package:demo/widgets/google_places_textfield_widget.dart';
import 'package:demo/widgets/maps_widget.dart';
import 'package:demo/widgets/points_banner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController textEditingController = TextEditingController();
  final MapsController mapsController = Get.find<MapsController>();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi ${authController.loginData.value.name},",
                  style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.bold),
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const PointsBanner(),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 50,
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(30),
                elevation: 3,
                color: Colors.white,
                shadowColor: Colors.white,
                child: GooglePlacesTextFieldWidget(
                  focusNode: _focusNode,
                  placeHolderText: "Where From?",
                  controller: textEditingController,
                  getPlaceDetailHandler: (prediction) {
                    _focusNode.unfocus();
                    Get.to(() => const TripConfirmScreen());
                    mapsController.getDestination(
                        LatLng(double.parse(prediction.lat ?? '0.0'),
                            double.parse(prediction.lng ?? '0.0')),
                        context);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              color: Colors.grey.shade100,
              child: const MapSample(),
            ),
          ],
        ),
      ),
    );
  }
}
