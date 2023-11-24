import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class MyIndecator extends StatelessWidget {
  const MyIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.defaultColor,
          ),
        ),
      ],
    );
  }
}
