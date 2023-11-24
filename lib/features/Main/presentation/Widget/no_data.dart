import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          AppSizedBox.sizedH20,
          Center(
            child: Text(
              "there is No Data ! ",
              style: AppTextStyle.textStyleMediumGray15,
            ),
          ),
        ],
      ),
    );
  }
}
