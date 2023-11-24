import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class MakeactionButton extends StatelessWidget {
  // final String text;
  final bool condition;

  const MakeactionButton({
    Key? key,
    // required this.text,
    required this.condition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition
        ? Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red, width: 2)),
            child: Center(
              child: Text(
                AppLocalizations.of(context).translate("un_follow"),
                style: AppTextStyle.textStyleMediumdefault,
              ),
            ),
          )
        : Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context).translate("follow"),
                style: AppTextStyle.textStyleRegulargreenLight15,
              ),
            ),
          );
  }
}
