import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:demo/configs/constants.dart';
import 'package:demo/models/login_data_model.dart';
import 'package:demo/screens/bottom_menu.dart';
import 'package:demo/screens/login_screen.dart';

class AuthController extends GetxController {
  final firebase = FirebaseAuth.instance;
  DatabaseReference firebaseDatabase = FirebaseDatabase.instance.ref('users');
  final loginData = LoginData().obs;
  var isLoggingIn = false.obs;
  // var loginData = LoginData();

  Future<void> signup(String name, String email, String password, String dob,
      String phone) async {
    isLoggingIn.value = true;
    try {
      await firebase
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
              (value) => createUser(value.user!.uid, email, name, dob, phone));
    } catch (c) {
      Get.showSnackbar(GetSnackBar(message: c.toString()));
    }
    isLoggingIn.value = false;
  }

  Future<void> login(String email, String password) async {
    isLoggingIn.value = true;

    try {
      await firebase
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => getCurrentUser(value.user?.uid ?? ""))
          .then((value) => Get.to(() => const BottomMenu()));

      // print("RESPONSE $response");
    } catch (c) {
      Get.showSnackbar(GetSnackBar(
        message: c.toString(),
      ));
    }
    isLoggingIn.value = false;
  }

  Future<void> getCurrentUser(String uid) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/$uid.json'));
      loginData.value = LoginData.fromJson(response.body);
    } catch (c) {
      Get.showSnackbar(GetSnackBar(
        message: c.toString(),
      ));
    }
  }

  Future<void> createUser(
      String uid, String email, String name, String dob, String phone) async {
    final body = {
      "uid": uid,
      "email": email,
      "name": name,
      "dob": dob,
      "phone": phone,
    };

    try {
      await firebaseDatabase.child(uid).set(body);
      await getCurrentUser(uid);
      Get.off(() => const BottomMenu());
    } catch (c) {
      Get.showSnackbar(GetSnackBar(
        message: c.toString(),
      ));
    }
  }

  void logout() async {
    await firebase.signOut().then((value) => Get.off(() => LoginScreen()));
  }
}

final AuthController authController = Get.find<AuthController>();
