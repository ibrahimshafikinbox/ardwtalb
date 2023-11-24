import 'package:ardwtalab/core/widget/App_logo.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guest"),
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 30,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          AppSizedBox.sizedH20,
          const Center(
            child: SizedBox(
              height: 120,
              width: 240,
              child: AppLogo(),
            ),
          ),
          AppSizedBox.sizedH50,
          const Text(
            "Only logged in user can log in",
            style: AppTextStyle.textStyleMediumdefault,
          ),
          AppSizedBox.sizedH20,
          const Text(
            "Open Messages ",
            style: AppTextStyle.textStyleMediumAppBlack,
          ),
          AppSizedBox.sizedH40,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              function: () {},
              text: " Log In   ",
            ),
          ),
          AppSizedBox.sizedH20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultButton(
              function: () {},
              text: " Create account   ",
            ),
          ),
        ],
      ),
    );
  }
}
