import 'package:ardwtalab/core/helper/image_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSizedBox.sizedH60,
        Center(
          child: Image.asset(AppImages.noNotification),
        ),
        Text(
          AppLocalizations.of(context).translate("no_notifications"),
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        AppSizedBox.sizedH15,
        Text(
          AppLocalizations.of(context).translate("we_will_notify"),
          style: const TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
