import 'package:flutter/material.dart';
import 'package:riyadh_transportation/configs/colors.dart';
import 'package:riyadh_transportation/screens/home_screen.dart';
import 'package:riyadh_transportation/screens/rewards_screen.dart';
import 'package:riyadh_transportation/screens/settings_screen.dart';
import 'package:riyadh_transportation/screens/trip_history_screen.dart';
import 'package:riyadh_transportation/widgets/custom_bottom_bar.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      bottomNavigationBar: CustomBottomBar(
          selectedIndex: selectedIndex,
          onChangeIndex: (index) {
            setState(() {
              selectedIndex = index;
            });
          }),
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    switch (selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return const RewardsScreen();
      case 2:
        return const TripsHistoryScreen();
      case 3:
        return const SettingsScreen();
      default:
        return const SizedBox();
    }
  }
}
