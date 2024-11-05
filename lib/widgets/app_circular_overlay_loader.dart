import 'dart:ui';

import 'package:flutter/material.dart';

class AppOverlayLoader extends StatelessWidget {
  const AppOverlayLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.1),
          ),
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
