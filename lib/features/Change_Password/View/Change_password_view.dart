// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Change_Password/cubit/change_pass_cubit.dart';
import 'package:ardwtalab/features/Login/View/Widget/Custom_Form_Field.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var newPasswordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("change_pass"),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(children: [
        AppSizedBox.sizedH30,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultFormField(
            controller: oldPasswordController,
            type: TextInputType.visiblePassword,
            label: AppLocalizations.of(context).translate("old_pass"),

            hint: '********************',
            // prefix: Icons.lock_outline,
            suffixPressed: () {},
            onValidate: (String? value) {
              if (value == null || value.isEmpty) {
                return 'reqired';
              }
              return null;
            },
            lines: null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultFormField(
            controller: newPasswordController,
            type: TextInputType.visiblePassword,
            label: AppLocalizations.of(context).translate("new_password"),

            hint: '********************',
            // prefix: Icons.lock_outline,
            suffixPressed: () {},
            onValidate: (String? value) {
              if (value == null || value.isEmpty) {
                return 'reqired';
              }
              return null;
            },
            lines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultFormField(
            controller: newPasswordConfirmationController,
            type: TextInputType.visiblePassword,
            label: AppLocalizations.of(context).translate("new_password"),

            hint: '********************',
            // prefix: Icons.lock_outline,
            suffixPressed: () {},
            onValidate: (String? value) {
              if (value == null || value.isEmpty) {
                return 'reqired';
              }
              return null;
            },
            lines: null,
          ),
        ),
        const Spacer(),
        DefaultButton(
          function: () {
            ChangePasswordCubit.get(context).changePassword(
                oldPassword: oldPasswordController.text,
                newPassword: newPasswordController.text,
                confirmNewPassword: newPasswordConfirmationController.text);
          },
          text: AppLocalizations.of(context).translate("save"),
        ),
        AppSizedBox.sizedH25,
      ]),
    );
  }
}
