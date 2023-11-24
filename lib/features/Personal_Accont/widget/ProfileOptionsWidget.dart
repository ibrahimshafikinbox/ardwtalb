// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/LogOut.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/Favorits/View/favorite_view.dart';
import 'package:ardwtalab/features/Personal_Accont/widget/my_Row_widget.dart';

import '../../../core/helper/navigation_helper.dart';
import '../../Change_Password/View/Change_password_view.dart';
import '../../My_Ads/View/my_ads_view.dart';
import '../View/personal_information_view.dart';

class ProfileOptionWidget extends StatefulWidget {
  const ProfileOptionWidget({super.key});

  @override
  State<ProfileOptionWidget> createState() => _ProfileOptionWidgetState();
}

class _ProfileOptionWidgetState extends State<ProfileOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogOut(),
        MyRowWidget(
          ontap: () {
            navigateTo(
              context,
              const PersonalInformationView(),
            );
          },
          icon: Icons.person_2_outlined,
          text: AppLocalizations.of(context).translate(
            "personal_info",
          ),
        ),
        MyRowWidget(
          ontap: () {
            navigateTo(
              context,
              const FavoritesView(),
            );
          },
          icon: Icons.favorite_border_outlined,
          text: AppLocalizations.of(context).translate(
            "favorites",
          ),
        ),
        MyRowWidget(
          ontap: () {
            navigateTo(
              context,
              const ChangePasswordView(),
            );
          },
          icon: Icons.security_outlined,
          text: AppLocalizations.of(context).translate(
            "change_pass",
          ),
        ),
        MyRowWidget(
          ontap: () {
            navigateTo(context, const MyAdsView());
          },
          icon: Icons.ad_units,
          text: AppLocalizations.of(context).translate(
            "my_ads",
          ),
        ),
      ],
    );
  }
}
