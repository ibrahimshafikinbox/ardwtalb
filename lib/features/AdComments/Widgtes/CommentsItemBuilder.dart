// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class CommentsItemBuilder extends StatelessWidget {
  final String profileimage;
  final String datetime;
  final String commentContent;
  final String userName;

  const CommentsItemBuilder({
    Key? key,
    required this.profileimage,
    required this.datetime,
    required this.commentContent,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 228, 228),
            borderRadius: BorderRadius.circular(12),
          ),
          // height: 150,
          width: double.infinity,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(profileimage),
                  ),
                  AppSizedBox.sizedW5,
                  Text(
                    userName,
                    style: AppTextStyle.textStyleMediumBlack,
                  ),
                  // const Spacer(),
                  const Spacer(),
                  const Icon(
                    Icons.timer_outlined,
                    color: AppColors.grey,
                  ),
                  AppSizedBox.sizedW5,
                  Text(datetime),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(commentContent),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [

            //     const Text(
            //       "reply",
            //       style: AppTextStyle.underLineText,
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       child: const Text(
            //         "delete",
            //         style: AppTextStyle.underLineText,
            //       ),
            //     ),
            //   ],
            // ),
            AppSizedBox.sizedH20
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.sizedW10,
            Text(
              AppLocalizations.of(context).translate("reply"),
              style: AppTextStyle.underLineText,
            ),
            AppSizedBox.sizedW10,
            Text(
              AppLocalizations.of(context).translate("delete"),
              style: AppTextStyle.underLineText,
            ),
          ],
        ),
      ],
    );
  }
}
