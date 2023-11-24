import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class UserDetailsBuildSWidget extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onpressed;
  // ignore: prefer_typing_uninitialized_variables
  final ratingvalue;
  const UserDetailsBuildSWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.onpressed,
    this.ratingvalue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.network(
                      image,
                    ),
                  ),
                ),
                AppSizedBox.sizedW10,
                Column(
                  children: [
                    AppSizedBox.sizedH10,
                    Text(
                      "$name            ",
                      style: AppTextStyle.textStyleMediumBlack,
                    ),
                    TextButton(
                      onPressed: onpressed,
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("show_user_details"),
                        style: AppTextStyle.textStyleMediumGray15,
                      ),
                    ),
                    AppSizedBox.sizedW20,
                  ],
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: ratingvalue,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                  tapOnlyMode: true,
                  unratedColor: Colors.grey,
                ),
                AppSizedBox.sizedW5,
                Text("($ratingvalue)")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
