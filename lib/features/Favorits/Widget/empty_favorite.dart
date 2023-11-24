import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/colors/colors.dart';
import '../../resources/styles/app_sized_box.dart';
import '../../resources/styles/app_text_style.dart';

class FavoriteIsEmpty extends StatefulWidget {
  const FavoriteIsEmpty({super.key});

  @override
  State<FavoriteIsEmpty> createState() => _FavoriteIsEmptyState();
}

class _FavoriteIsEmptyState extends State<FavoriteIsEmpty> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            const Icon(
              Icons.favorite_border,
              size: 35,
              color: AppColors.defaultColor,
            ),
            AppSizedBox.sizedH10,
            Text(AppLocalizations.of(context).translate("no_item_in_favorite"),
                style: AppTextStyle.textStyleMediumdefault),
          ],
        ),
      ),
    );
  }
}
