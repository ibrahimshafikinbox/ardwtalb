import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppSizedBox.sizedH20,
        Center(
          child: Text(
            "you are offline ",
            style: AppTextStyle.textStyleMediumGray15,
          ),
        ),
      ],
    );
  }
}
