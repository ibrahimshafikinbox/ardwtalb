import 'package:ardwtalab/core/helper/filter_text_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/About_Us/cubit/about_us_cubit.dart';
import 'package:ardwtalab/features/About_Us/cubit/about_us_state.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';

import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUSView extends StatefulWidget {
  const AboutUSView({super.key});

  @override
  State<AboutUSView> createState() => _AboutUSViewState();
}

class _AboutUSViewState extends State<AboutUSView> {
  @override
  void initState() {
    super.initState();
    AboutUSCubit.get(context).getAboutUS();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String filteredTextAboutUS = filterArabicText(
        "${AboutUSCubit.get(context).aboutUSModel?.data?.content}");

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("about_us")),
        actions: [
          IconButton(
            onPressed: () {
              AboutUSCubit.get(context).getAboutUS();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<AboutUSCubit, AboutUSState>(
            builder: (context, state) {
              if (state is GetAboutUSLoading) {
                return const MyIndecator();
              } else if (state is GetAboutUSSuccess) {
                return Expanded(
                  child: ListView(
                    children: [
                      Image.asset("assets/image/app_logo.png"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filterArabicText(
                              "${AboutUSCubit.get(context).aboutUSModel?.data?.content}"),
                          style: AppTextStyle.textStyleMediumBlack,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GetAboutUSError) {
                return const Text('Error occurred');
              } else {
                return TextButton(
                    onPressed: () {}, child: const Text("refresh"));
              }
            },
          ),
        ],
      ),
    );
  }
}
