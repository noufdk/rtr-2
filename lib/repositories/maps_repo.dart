import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:riyadh_transportation/configs/constants.dart';

import '../models/travel_time_model.dart';

class MapsRepository {
  Future<String> getRouteCoordinates(
      LatLng? origin, LatLng? destination) async {
    print("HELLO??");
    final url = 'https://maps.googleapis.com/maps/api/directions/json'
        '?origin=${origin?.latitude},${origin?.longitude}'
        '&destination=${destination?.latitude},${destination?.longitude}'
        '&key=$apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final routes = data['routes'];

        if (routes.isNotEmpty) {
          final polylinePoints = routes[0]['overview_polyline']['points'];
          return polylinePoints;
        }
      }
    } catch (c) {
      print("HELLO??");
      throw Exception('Failed to load route');
    }

    return "";
  }

  Future<TravelTime> getTravelDetails(
      LatLng? origin, LatLng? destination) async {
    final url =
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${origin?.latitude},${origin?.longitude}&destinations=${destination?.latitude},${destination?.longitude}&key=$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        TravelTime data = travelTimeFromMap(response.body);
        return data;
      }
    } catch (e) {
      TravelTime();
    }
    return TravelTime();
  }
}
