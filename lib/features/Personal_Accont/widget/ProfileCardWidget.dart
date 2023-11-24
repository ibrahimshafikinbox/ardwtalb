// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:ardwtalab/core/widget/my_rating.dart';

import '../../resources/styles/app_sized_box.dart';
import '../../resources/styles/app_text_style.dart';

class ProfileCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String createdAt;
  // ignore: prefer_typing_uninitialized_variables
  final ratingvalue;

  const ProfileCardWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.createdAt,
    required this.ratingvalue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
                AppSizedBox.sizedW15,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizedBox.sizedH10,
                    Text(
                      name,
                      style: AppTextStyle.textStyleMediumBlack,
                    ),
                    AppSizedBox.sizedH10,
                    Text(
                      createdAt,
                      style: AppTextStyle.textStyleMediumGray12,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyRating(value: ratingvalue),
                    ),
                    AppSizedBox.sizedH10,
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
