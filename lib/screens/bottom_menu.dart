import 'package:flutter/material.dart';
import 'package:demo/configs/colors.dart';
import 'package:demo/screens/home_screen.dart';
import 'package:demo/screens/rewards_screen.dart';
import 'package:demo/screens/settings_screen.dart';
import 'package:demo/screens/trip_history_screen.dart';
import 'package:demo/widgets/custom_bottom_bar.dart';

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
