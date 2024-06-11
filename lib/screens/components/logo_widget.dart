import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/icons/logo.png',
        scale: 1,
        // width: 400,
        // height: 400,
      ),
    );
  }
}
