// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ardwtalab/core/widget/action_button.dart';
import 'package:ardwtalab/core/widget/mobile_show.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class CustomerData extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Fullname;
  final String createdat;
  final String avatar;
  final String phonenumber;
  final bool conditionn;
  final VoidCallback followonpressed;
  final VoidCallback makeChatOnpress;

  final VoidCallback addRatingOnPressed;
  final VoidCallback makecallonpress;

  // ignore: prefer_typing_uninitialized_variables
  final ratingvalue;

  const CustomerData({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Fullname,
    required this.createdat,
    required this.avatar,
    required this.phonenumber,
    required this.conditionn,
    required this.followonpressed,
    required this.makeChatOnpress,
    required this.addRatingOnPressed,
    required this.makecallonpress,
    this.ratingvalue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  avatar,
                  height: 80,
                ),
                AppSizedBox.sizedW15,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSizedBox.sizedH10,
                    Text(
                      Fullname,
                      style: AppTextStyle.textStyleMediumBlack,
                    ),
                    AppSizedBox.sizedH10,
                    Text(
                      createdat,
                      style: AppTextStyle.textStyleMediumGray12,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
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
                    AppSizedBox.sizedH10,
                    TextButton(
                      onPressed: addRatingOnPressed,
                      child: RichText(
                        text: TextSpan(
                          text: AppLocalizations.of(context)
                              .translate("add_rating"),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,

                            decoration: TextDecoration
                                .underline, // Add underline decoration
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ShowMobile(
                phoneOnPressed: makecallonpress,
                requiredphone: phonenumber,
              ),
              AppSizedBox.sizedW10,
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 188, 187, 187)),
                  child: IconButton(
                      onPressed: makeChatOnpress,
                      icon: const Icon(Icons.message))),
              const Spacer(),
              GestureDetector(
                onTap: followonpressed,
                child: MakeactionButton(
                  condition: conditionn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
