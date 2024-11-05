import 'package:flutter/material.dart';
import 'package:demo/configs/colors.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar(
      {super.key, required this.selectedIndex, required this.onChangeIndex});
  int selectedIndex;
  Function(int) onChangeIndex;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey.shade400),
        ),
      ),
      height: 80,
      child: Row(
        children: [
          BottomBarItem(
            text: "Home",
            color: widget.selectedIndex == 0
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            icon: const Icon(
              Icons.home,
              color: AppColors.primaryDarkColor,
            ),
            onTap: () {
              widget.onChangeIndex(0);
            },
          ),
          BottomBarItem(
              color: widget.selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              text: "Rewards",
              icon: const Icon(
                Icons.card_giftcard,
                color: AppColors.primaryDarkColor,
              ),
              onTap: () {
                widget.onChangeIndex(1);
              }),
          BottomBarItem(
            color: widget.selectedIndex == 2
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            text: "Trip History",
            icon: const Icon(
              Icons.history,
              color: AppColors.primaryDarkColor,
            ),
            onTap: () {
              widget.onChangeIndex(2);
            },
          ),
          BottomBarItem(
            color: widget.selectedIndex == 3
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            text: "Settings",
            icon: const Icon(
              Icons.settings,
              color: AppColors.primaryDarkColor,
            ),
            onTap: () {
              widget.onChangeIndex(3);
            },
          ),
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.color,
  });

  final VoidCallback onTap;
  final String text;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                text,
                style: const TextStyle(color: AppColors.primaryDarkColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
