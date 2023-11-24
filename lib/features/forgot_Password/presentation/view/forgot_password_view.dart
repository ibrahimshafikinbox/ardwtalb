import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  var forgotPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            AppSizedBox.sizedH25,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: AppColors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            Image.asset("assets/image/app_logo.png"),
            AppSizedBox.sizedH30,
            const Text(
              "Forgot Password  ? ",
              style: AppTextStyle.defaultcolorlarg,
            ),
            AppSizedBox.sizedH20,
            const Text(
              "please write your phone number  ",
              style: AppTextStyle.textStyleMediumGray15,
            ),
            AppSizedBox.sizedH40,
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IntlPhoneField(
                showCursor: false,

                controller: forgotPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Phone ',
                  border: OutlineInputBorder(),
                ),
                initialCountryCode:
                    ' US', // Replace with your desired initial country code.
                onChanged: (phone) {},
              ),
            ),
            AppSizedBox.sizedH20,
            DefaultButton(
              function: () {},
              text: " next  ",
            ),
          ],
        ),
      ),
    );
  }
}
