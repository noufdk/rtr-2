import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:demo/configs/assets.dart';
import 'package:demo/models/travel_time_model.dart' as travel;
import 'package:demo/repositories/maps_repo.dart';
import 'package:demo/widgets/app_button.dart';

class MapsController extends GetxController {
  var currentPosition = const LatLng(0.0, 0.0).obs;
  var destinationPosition = const LatLng(0.0, 0.0).obs;
  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;
  var distance = 0.0.obs;
  var isInitializing = false.obs;
  var isLoadingDestination = false.obs;

  GoogleMapController? googleMapController;
  final MapsRepository _mapsRepository = MapsRepository();
  travel.TravelTime? travelTime;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    isInitializing.value = true;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("Permission Error", "Location Permission Denied!");
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition.value = LatLng(position.latitude, position.longitude);

      addMarker(currentPosition.value);
    } catch (e) {
      print("Error getting location: $e");
    }
    isInitializing.value = false;
  }

  void getDestination(LatLng latLng, BuildContext context) {
    isLoadingDestination.value = true;
    destinationPosition.value = latLng;
    addMarker(destinationPosition.value);
    generatePolyline(context);
  }

  void addMarker(LatLng position) {
    Marker marker = Marker(
      markerId: MarkerId('${position.latitude}'),
      position: position,
      infoWindow: const InfoWindow(title: 'Current Location'),
    );
    if (markers.length == 2) {
      List<Marker> myMarkers = markers.toList();
      myMarkers[1] = marker;
      markers.value = myMarkers.toSet();
    } else {
      markers.add(marker);
    }
    markers.refresh();
  }

  void updateCameraPosition() {
    googleMapController?.animateCamera(
      CameraUpdate.newLatLng(currentPosition.value),
    );
  }

  void updateMarker(LatLng position) {
    addMarker(position);
    updateCameraPosition();
  }

  Future<Polyline> generatePolyline(BuildContext context) async {
    polylines.clear();
    final pointsString = await _mapsRepository.getRouteCoordinates(
        currentPosition.value, destinationPosition.value);
    travelTime = await _mapsRepository.getTravelDetails(
        currentPosition.value, destinationPosition.value);

    final List<LatLng> points = _decodePolyline(pointsString);

    final polyline = Polyline(
        polylineId: const PolylineId("Line"),
        points: points,
        color: Colors.black,
        width: 2);

    polylines.add(polyline);

    polylines.refresh();

    isLoadingDestination.value = false;
    selectModeDialog(context);

    _zoomToFitMarkersAndPolyline();

    return polyline;
  }

  void _zoomToFitMarkersAndPolyline() async {
    final pointA = markers.first.position;
    final pointB = markers.last.position;

    print("A $pointA B $pointB");

    // Define bounds
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        pointA.latitude < pointB.latitude ? pointA.latitude : pointB.latitude,
        pointA.longitude < pointB.longitude
            ? pointA.longitude
            : pointB.longitude,
      ),
      northeast: LatLng(
        pointA.latitude > pointB.latitude ? pointA.latitude : pointB.latitude,
        pointA.longitude > pointB.longitude
            ? pointA.longitude
            : pointB.longitude,
      ),
    );

    // Update camera to fit the bounds
    CameraUpdate update =
        CameraUpdate.newLatLngBounds(bounds, 50); // 50 is padding
    await googleMapController!.animateCamera(update);
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;
      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polyline.add(LatLng(
        (lat / 1E5),
        (lng / 1E5),
      ));
    }
    return polyline;
  }

  void selectModeDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) => PopScope(
              canPop: false,
              onPopInvoked: (didPop) {
                if (didPop) return;
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                        child: Text(
                      "Select Transport Mode",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Flexible(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(Assets.walk),
                                  ),
                                ),
                              ),
                              const Flexible(child: Text("50 points"))
                            ],
                          ),
                          Column(
                            children: [
                              Flexible(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(Assets.cycle),
                                  ),
                                ),
                              ),
                              const Flexible(child: Text("40 points"))
                            ],
                          ),
                          Column(
                            children: [
                              Flexible(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(Assets.scooty),
                                  ),
                                ),
                              ),
                              const Flexible(child: Text("30 points"))
                            ],
                          ),
                          Column(
                            children: [
                              Flexible(
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(Assets.bus),
                                  ),
                                ),
                              ),
                              const Flexible(child: Text("20 points"))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AppButton(
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
