import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Login/View/Widget/Custom_Form_Field.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/contact_with_us/cubit/contact_cubit.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ContactWithUsView extends StatefulWidget {
  const ContactWithUsView({super.key});

  @override
  State<ContactWithUsView> createState() => _ContactWithUsViewState();
}

class _ContactWithUsViewState extends State<ContactWithUsView> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //         "contact_with_us": "تواصل معنا",
        //  "privacy": "الخصوصية",
        //  "terms": "الشروط والأحكام",
        //  "Change_language": "تغيير اللغة",
        //  "about_us": "عنا",
        //  "tell_us": "قل لنا استفسارك أو شكواك",
        //  "name": "الاسم",
        //  "email": "البريد الإلكتروني",
        //  "emmsage_content": "محتوى الرسالة",
        //  "send": "إرسال",

        title: Text(
          AppLocalizations.of(context).translate("contact_with_us"),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizedBox.sizedH25,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate("tell_us"),
                    style: AppTextStyle.textStyleMediumBlack,
                  ),
                ),
                AppSizedBox.sizedH25,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: nameController,
                    type: TextInputType.visiblePassword,
                    // label: " retype new password   ",
                    hint: 'name',
                    // prefix: Icons.lock_outline,
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: null, label: 'name',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: phoneController,
                    type: TextInputType.visiblePassword,
                    // label: " retype new password   ",
                    hint: 'phone',
                    // prefix: Icons.lock_outline,
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    // label: " retype new password   ",
                    lines: null, label: 'phone',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: emailController,
                    type: TextInputType.visiblePassword,
                    // label: " retype new password   ",
                    hint: 'email',
                    // prefix: Icons.lock_outline,
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: null, label: 'email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: messageController,
                    type: TextInputType.visiblePassword,
                    // label: " retype new password   ",
                    hint: 'emmsage_content',
                    // prefix: Icons.lock_outline,
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: 4, label: 'emmsage_content',
                  ),
                ),
                AppSizedBox.sizedH100,
                DefaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ContactWithUsCubit.get(context).contactWithUs(
                            email: emailController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                            message: messageController.text);
                      }
                    },
                    text: AppLocalizations.of(context).translate("send")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
