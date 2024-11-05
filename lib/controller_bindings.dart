import 'package:get/get.dart';
import 'package:riyadh_transportation/controllers/auth_controller.dart';
import 'package:riyadh_transportation/controllers/maps_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MapsController>(MapsController());
    Get.put<AuthController>(AuthController());
  }
}
