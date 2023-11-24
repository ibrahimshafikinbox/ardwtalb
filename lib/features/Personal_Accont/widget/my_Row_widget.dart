import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/core/widget/icon_widget.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class MyRowWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback ontap;

  const MyRowWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                MyIconWidget(
                  iconcolor: Colors.white,
                  icon: icon,
                  requiredcolor: AppColors.defaultColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(text, style: AppTextStyle.textStyleMediumBlack),
                const Spacer(),
                const Icon(
                  Icons.navigate_next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
