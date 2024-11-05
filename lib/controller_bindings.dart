import 'package:demo/controllers/auth_controller.dart';
import 'package:demo/controllers/maps_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MapsController>(MapsController());
    Get.put<AuthController>(AuthController());
  }
}
