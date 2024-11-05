import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riyadh_transportation/controllers/maps_controller.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final controller = Get.find<MapsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return controller.isInitializing.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: controller.currentPosition.value,
                    zoom: 14,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.googleMapController = googleMapController;
                  },
                  markers: controller.markers.value,
                  polylines: controller.polylines.value,
                );
        },
      ),
    );
  }
}
