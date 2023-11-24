import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/My_Ads/Widgets/AdsBuilderWidget.dart';
import 'package:ardwtalab/features/My_Ads/cubit/my_ads_cubit.dart';
import 'package:ardwtalab/features/My_Ads/cubit/my_ads_state.dart';
import 'package:ardwtalab/features/New_ad/View/create_new_ad_View.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAdsView extends StatefulWidget {
  const MyAdsView({super.key});

  @override
  State<MyAdsView> createState() => _MyAdsViewState();
}

class _MyAdsViewState extends State<MyAdsView> {
  @override
  void initState() {
    super.initState();
    MyAdsCubit.get(context).getMyAds();
  }

//  "my_ads": "إعلاناتي",
//    "ads_empty": "قائمة الإعل
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("my_ads")),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, const NewAdView());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        BlocBuilder<MyAdsCubit, MyadsStates>(
          builder: (context, state) {
            if (state is GetMyAdsLoading) {
              return const MyIndecator();
            } else if (state is GetMyAdsSuccess) {
              // ignore: prefer_is_empty
              if (MyAdsCubit.get(context).myAdsModel?.data?.length == 0) {
                return Column(
                  children: [
                    AppSizedBox.sizedH40,
                    Center(
                        child: Text(
                      AppLocalizations.of(context).translate("ads_empty"),
                      style: AppTextStyle.textStyleBoldBlack,
                    )),
                  ],
                );
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: MyAdsCubit.get(context).myAdsModel?.data?.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var myadsdetails =
                          MyAdsCubit.get(context).myAdsModel?.data![index];
                      return AdsBuilderWidget(
                        image: "${myadsdetails?.image}",
                        title: myadsdetails?.title ?? "",
                        createdat: "${myadsdetails?.createdAt ?? ""}",
                        city: myadsdetails?.city?.name ?? "",
                        name: myadsdetails?.customer?.name ?? "",
                      );
                    }),
              );
            } else if (state is GetMyAdsError) {
              return const Text(
                'Error occurred',
              );
            } else {
              return const Text('Initial state');
            }
          },
        ),
      ]),
    );
  }
}
