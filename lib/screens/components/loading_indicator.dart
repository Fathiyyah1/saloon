import 'package:flutter/material.dart';
import 'package:saloon/screens/utils/global.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(backgroundColor: AppColors.Dark),
    );
  }
}
