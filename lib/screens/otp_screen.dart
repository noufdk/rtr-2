import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:riyadh_transportation/configs/colors.dart';
import 'package:riyadh_transportation/widgets/app_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade400, width: 0.5)),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "6 digit-code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter the code we sent you to (+966) 534567233",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
              ),
              const SizedBox(
                height: 25,
              ),
              PinCodeTextField(
                appContext: context,
                errorTextSpace: 20.0,

                separatorBuilder: (context, index) => index == 2
                    ? const SizedBox(
                        width: 30,
                        child: Center(
                            child: Text(
                          "-",
                          style: TextStyle(fontSize: 22),
                        )))
                    : const SizedBox(
                        width: 15,
                      ),
                errorTextMargin:
                    const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                // controller: otpTextController,
                autoDisposeControllers: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.start,

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                length: 6,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  fieldHeight: 45,
                  fieldWidth: 40,
                  selectedColor: AppColors.primaryColor,
                  inactiveColor: Colors.grey,
                  activeFillColor: AppColors.secondaryColor,
                  activeColor: AppColors.primaryColor,
                  activeBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  errorBorderWidth: 1,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Code is expired in 60s",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Resend",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton(onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
