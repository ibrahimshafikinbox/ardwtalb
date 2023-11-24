// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/core/widget/icon_widget.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class BottomAppDetails extends StatelessWidget {
  final String price;
  final String adAddress;
  final String appSection;
  final String area;
  final String city;
  final String adType;
  final String requiredimage;
  final String adContent;
  final VoidCallback commentsonpressed;
  final VoidCallback likesonpressed;
  final VoidCallback disLikeonpressed;
  final VoidCallback followsonpressed;
  final bool followingConditon;

  const BottomAppDetails({
    Key? key,
    required this.price,
    required this.adAddress,
    required this.appSection,
    required this.area,
    required this.city,
    required this.adType,
    required this.requiredimage,
    required this.adContent,
    required this.commentsonpressed,
    required this.likesonpressed,
    required this.disLikeonpressed,
    required this.followsonpressed,
    required this.followingConditon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //      "ad_details": "تفاصيل الإعلان",
              //  "report": "الإبلاغ عن الإعلان",
              //  "ad number": "رقم الإعلان",
              //  "ad_address": "عنوان الإعلان",
              //  "app_sec": "قسم التطبيق",
              //  "area": "المنطقة",
              //  "city": "المدينة",
              //  "ad_type": "نوع الإعلان",
              //  "follow": "متابعة",
              //  "comments": "تعليقات",
              //  "write_cooment": "اكتب تعليقك",
              Text(
                AppLocalizations.of(context).translate("ad_details"),
                style: AppTextStyle.textStyleBoldBlack,
              ),
            ],
          ),
          AppSizedBox.sizedH20,
          Row(
            children: [
              const Icon(
                Icons.price_change_outlined,
                color: AppColors.green,
              ),
              AppSizedBox.sizedW5,
              Text(
                price,
                style: AppTextStyle.textStyleRegulargreenLight15,
              )
            ],
          ),
          AppSizedBox.sizedW5,
          Text(
            adContent,
            style: AppTextStyle.textStyleMediumBlack,
          ),
          AppSizedBox.sizedH15,
          Row(
            children: [
              AppSizedBox.sizedW5,
              Text(
                AppLocalizations.of(context).translate("ad_address"),
                style: AppTextStyle.textStyleMediumBlack,
              ),
              Text(
                " $adAddress",
                style: AppTextStyle.textStyleMediumBlack,
              ),
            ],
          ),
          AppSizedBox.sizedH15,
          Row(
            children: [
              AppSizedBox.sizedW5,
              Text(
                AppLocalizations.of(context).translate("app_sec"),
                style: AppTextStyle.textStyleMediumBlack,
              ),
              Text(
                " $appSection  ",
                style: AppTextStyle.textStyleMediumBlack,
              ),
              //Application section
            ],
          ),
          AppSizedBox.sizedH15,
          Row(
            children: [
              AppSizedBox.sizedW5,
              Text(
                AppLocalizations.of(context).translate("area"),
                style: AppTextStyle.textStyleMediumBlack,
              ),
              Text(
                " $area   ",
                style: AppTextStyle.textStyleMediumBlack,
              ),
              //Application section
            ],
          ),
          AppSizedBox.sizedH15,
          Row(
            children: [
              AppSizedBox.sizedW5,
              Text(
                AppLocalizations.of(context).translate("city"),
                style: AppTextStyle.textStyleMediumBlack,
              ),
              Text(
                " $city   ",
                style: AppTextStyle.textStyleMediumBlack,
              ),
              //Application section
            ],
          ),
          AppSizedBox.sizedH15,
          Row(
            children: [
              AppSizedBox.sizedW5,
              Text(
                AppLocalizations.of(context).translate("ad_type"),
                style: AppTextStyle.textStyleMediumBlack,
              ),
              Text(
                " $adType   ",
                style: AppTextStyle.textStyleMediumBlack,
              ),
              //Application section
            ],
          ),
          AppSizedBox.sizedH20,
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(requiredimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppSizedBox.sizedH20,
          Row(
            children: [
              followingConditon
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      height: 50,
                      width: 100,
                      child: Center(
                          child: TextButton(
                        onPressed: followsonpressed,
                        child: Text(
                          AppLocalizations.of(context).translate("un_follow"),
                          style: AppTextStyle.textStyleWhiteSemiBold,
                        ),
                      )),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      height: 50,
                      // width: 100,
                      child: Center(
                          child: TextButton(
                        onPressed: followsonpressed,
                        child: Text(
                          AppLocalizations.of(context).translate("follow"),
                          style: AppTextStyle.textStyleWhiteSemiBold,
                        ),
                      )),
                    ),
              const Spacer(),
              GestureDetector(
                onTap: likesonpressed,
                child: const MyIconWidget(
                  icon: Icons.thumb_up_alt_outlined,
                  requiredcolor: Color.fromARGB(255, 218, 215, 215),
                  iconcolor: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: disLikeonpressed,
                child: const MyIconWidget(
                  iconcolor: Colors.black,
                  icon: Icons.thumb_down_outlined,
                  requiredcolor: Color.fromARGB(255, 218, 215, 215),
                ),
              ),
            ],
          ),
          AppSizedBox.sizedH20,
          GestureDetector(
            onTap: commentsonpressed,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 239, 238, 238),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('comments'),
                      style: AppTextStyle.textStyleMediumBlack,
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
