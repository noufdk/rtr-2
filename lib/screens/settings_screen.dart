import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riyadh_transportation/configs/assets.dart';
import 'package:riyadh_transportation/configs/colors.dart';
import 'package:riyadh_transportation/controllers/auth_controller.dart';
import 'package:riyadh_transportation/widgets/app_text_field.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = authController.loginData.value.name ?? "";
    dobController.text = DateFormat('yyyy-MM-dd')
        .format(authController.loginData.value.dob ?? DateTime.now());
    phoneController.text = authController.loginData.value.phone ?? "";
    super.initState();
  }

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      Assets.leaf,
                      height: 50,
                    ),
                  ),
                ),
                const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: const BoxDecoration(color: AppColors.secondaryColor),
            child: Form(
              // key: globalKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  AppTextField(
                    label: "Name",
                    textEditingController: nameController,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppTextField(
                    label: "Date Of Birth",
                    readOnly: true,
                    textEditingController: dobController,
                    suffixIcon: const Icon(Icons.lock_outline),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppTextField(
                    label: "Phone Number",
                    readOnly: true,
                    textEditingController: phoneController,
                    suffixIcon: const Icon(Icons.phone),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Notification"),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          activeTrackColor: AppColors.primaryColor,
                          value: flag,
                          onChanged: (v) {
                            setState(() {
                              flag = !flag;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text("Language"),
                  //     PopupMenuButton(
                  //         itemBuilder: (context) {
                  //           return [
                  //             const PopupMenuItem(child: Text("English"))
                  //           ];
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 5, vertical: 2),
                  //           decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(5),
                  //               border: Border.all(
                  //                 width: 1,
                  //                 color: AppColors.primaryColor,
                  //               )),
                  //           child: const Row(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 Text("English"),
                  //                 Icon(Icons.keyboard_arrow_down)
                  //               ]),
                  //         ))
                  //   ],
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      authController.logout();
                    },
                    child: const Text("Logout"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Contact Us",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(Icons.mail_outline),
                    SizedBox(
                      width: 10,
                    ),
                    Text("RiyadhTransportationReward@RTR.com")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.call_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+955 512 345 6789")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("FAQS")
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
