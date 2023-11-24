// ignore: file_names
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/details/Widgets/DefaultIconDecoration.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';

class TopContainerorderDetails extends StatelessWidget {
  final String addnumber;
  final String time;
  final String creatorName;
  final String location;
  final String status;
  final String requiredphone;
  final VoidCallback phoneOnPressed;
  final VoidCallback addtofavoriteOnPressed;
  final VoidCallback userDetailsOnpress;
  final VoidCallback openWhatsappOnPress;
  final VoidCallback openchatOnPress;

  final String productName;
  final String admodel;
  final bool isfavoritecondition;

  const TopContainerorderDetails({
    Key? key,
    required this.addnumber,
    required this.time,
    required this.creatorName,
    required this.location,
    required this.status,
    required this.requiredphone,
    required this.phoneOnPressed,
    required this.addtofavoriteOnPressed,
    required this.userDetailsOnpress,
    required this.openWhatsappOnPress,
    required this.openchatOnPress,
    required this.productName,
    required this.admodel,
    required this.isfavoritecondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "    $productName",
                  style: AppTextStyle.textStyleMediumBlack,
                ),
                const Spacer(),
                IconButton(
                    onPressed: addtofavoriteOnPressed,
                    icon: isfavoritecondition
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                          )),
              ],
            ),
            Row(
              children: [
                const DefaultIconDecoration(
                  icon: Icons.numbers,
                ),
                AppSizedBox.sizedW5,
                Text(
                  AppLocalizations.of(context).translate("ad_number"),
                  style: AppTextStyle.textStyleRegularAppBlack14,
                ),
                AppSizedBox.sizedW10,
                Text(
                  addnumber,
                  style: AppTextStyle.textStyleRegularAppBlack14,
                ),
                const Spacer(),
                const DefaultIconDecoration(
                  icon: Icons.timeline,
                ),
                AppSizedBox.sizedW5,
                Text(
                  "$time ",
                  style: AppTextStyle.textStyleRegularAppBlack14,
                ),
              ],
            ),
            AppSizedBox.sizedH20,
            Row(
              children: [
                const DefaultIconDecoration(
                  icon: Icons.person,
                ),
                AppSizedBox.sizedW5,
                TextButton(
                  onPressed: userDetailsOnpress,
                  child: Text(
                    creatorName,
                    style: AppTextStyle.textStyleRegularAppBlack14,
                  ),
                ),
                const Spacer(),
                const DefaultIconDecoration(
                  icon: Icons.location_on,
                ),
                AppSizedBox.sizedW5,
                Text(
                  "$location ",
                  style: AppTextStyle.textStyleRegularAppBlack14,
                ),
              ],
            ),
            AppSizedBox.sizedH20,
            Row(
              children: [
                const DefaultIconDecoration(
                  icon: Icons.stay_current_landscape,
                ),
                AppSizedBox.sizedW5,
                Text(
                  "$status ",
                  style: AppTextStyle.textStyleRegularAppBlack14,
                ),
                const Spacer(),
                const DefaultIconDecoration(
                  icon: Icons.time_to_leave,
                ),
                AppSizedBox.sizedW5,
                Text(
                  " $admodel",
                  style: AppTextStyle.textStyleRegularAppBlack14,
                ),
              ],
            ),
            AppSizedBox.sizedH20,
            Row(
              children: [
                AppSizedBox.sizedW10,
                GestureDetector(
                  onTap: openchatOnPress,
                  child: const ConatactIconDecoration(
                      requiredicon: Icons.message_rounded),
                ),
                AppSizedBox.sizedW10,
                GestureDetector(
                    onTap: openWhatsappOnPress,
                    child: const ConatactIconDecoration(
                        requiredicon: Icons.whatshot)),
                AppSizedBox.sizedW10,
                GestureDetector(
                  onTap: phoneOnPressed,
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 219, 247, 219),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                        AppSizedBox.sizedW10,
                        Text(
                          " $requiredphone",
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            AppSizedBox.sizedH20,
          ],
        ),
      ),
    );
  }
}
