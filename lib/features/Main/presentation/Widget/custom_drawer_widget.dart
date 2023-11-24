import 'package:ardwtalab/core/helper/image_helper.dart';
import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/localizations/clasess/constants.dart';
import 'package:ardwtalab/core/localizations/clasess/language.dart';
import 'package:ardwtalab/core/network_constants/local_constants.dart';
import 'package:ardwtalab/features/About_Us/View/about_us.dart';
import 'package:ardwtalab/features/Login/Cubit/cubit/Login_Cubit.dart';
import 'package:ardwtalab/features/Login/View/login_View.dart';
import 'package:ardwtalab/features/Main/presentation/views/Main_View.dart';
import 'package:ardwtalab/features/Privacy/view/privacy_view.dart';
import 'package:ardwtalab/features/contact_with_us/contact_view.dart';
import 'package:ardwtalab/features/select_lang_view.dart';
import 'package:ardwtalab/features/terms_and_Conditions/View/terms.dart';
import 'package:ardwtalab/main.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors/colors.dart';
import '../../../resources/styles/app_text_style.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  bool showElevatedButton = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: <Widget>[
          Image.asset(AppImages.applogo),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.defaultColor),
            title: Text(
              AppLocalizations.of(context).translate("home"),
              style: AppTextStyle.textStyleMediumBlack,
            ),
            onTap: () {
              navigateTo(context, const Main_View());
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_outlined,
                color: AppColors.defaultColor),
            title: Text(
              AppLocalizations.of(context).translate("contact_with_us"),
              style: AppTextStyle.textStyleMediumBlack,
            ),
            onTap: () {
              navigateTo(context, const ContactWithUsView());
            },
          ),
          ListTile(
            leading: const Icon(Icons.warning, color: AppColors.defaultColor),
            title: Text(
              AppLocalizations.of(context).translate("privacy"),
              style: AppTextStyle.textStyleMediumBlack,
            ),
            onTap: () {
              navigateTo(context, const PrivacyView());
            },
          ),
          ListTile(
            leading: const Icon(Icons.confirmation_number_rounded,
                color: AppColors.defaultColor),
            title: Text(
              AppLocalizations.of(context).translate("terms"),
              style: AppTextStyle.textStyleMediumBlack,
            ),
            onTap: () {
              navigateTo(context, const TermsAndConditionView());
            },
          ),
          ListTile(
              title: Row(
            children: [
              Text(
                AppLocalizations.of(context).translate("Change_language"),
                style: AppTextStyle.textStyleMediumBlack,
              ),
              DropdownButton<Language>(
                underline: const SizedBox(),
                icon: const Icon(Icons.language, color: AppColors.defaultColor),
                onChanged: (Language? language) async {
                  if (language != null) {
                    Locale _locale = await setLocale(
                      language.languageCode,
                    );
                    MyApp.setLocale(context, _locale);
                  }
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: const TextStyle(fontSize: 30),
                            ),
                            Text(e.name)
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          )),
          ListTile(
            leading: const Icon(Icons.whatshot, color: AppColors.defaultColor),
            title: Text(
              AppLocalizations.of(context).translate("about_us"),
              style: AppTextStyle.textStyleMediumBlack,
            ),
            onTap: () {
              navigateTo(context, const AboutUSView());
            },
          ),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       showElevatedButton = true;
          //     });
          //   },

          //   child: ListTile(
          //     leading: const Icon(Icons.logout, color: AppColors.defaultColor),
          //     title: Text(
          //       AppLocalizations.of(context).translate("logout"),
          //       style: AppTextStyle.textStyleMediumBlack,
          //     ),
          //     // bool showElevatedButton = false;

          //     onTap: () {

          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
