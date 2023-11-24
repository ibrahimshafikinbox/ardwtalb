// ignore_for_file: file_names

import 'package:ardwtalab/features/resources/images/images.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.logo,
      ),
    );
  }
}
