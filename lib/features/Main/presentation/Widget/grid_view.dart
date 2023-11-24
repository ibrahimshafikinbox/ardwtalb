// ignore_for_file: file_names

import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/features/details/View/details_View.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/features/Main/Cubit/home_ads/home_Ads_Cubit.dart';
import 'package:ardwtalab/features/Main/Cubit/home_ads/home_ads_state.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';

import '../../data/Models/ads_model/datum.dart';

class ProductCardGrid extends StatefulWidget {
  const ProductCardGrid({super.key});

  @override
  State<ProductCardGrid> createState() => _ProductCardGridState();
}

class _ProductCardGridState extends State<ProductCardGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var adscubit = HomeAdsCubit.get(context);
    // AdsModel? adsModel;
    // Datum? datum;
    return BlocProvider(
      create: (context) => HomeAdsCubit(),
      child: BlocConsumer<HomeAdsCubit, HomeAdsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const HomeadsBody();
        },
      ),
    );
  }
}

class HomeadsBody extends StatefulWidget {
  // final VoidCallback onpressed;
  const HomeadsBody({
    Key? key,
    // required this.onpressed,
  }) : super(key: key);

  @override
  State<HomeadsBody> createState() => _HomeadsBodyState();
}

class _HomeadsBodyState extends State<HomeadsBody> {
  @override
  void initState() {
    super.initState();
    HomeAdsCubit.get(context).getHomeAds();
  }

  @override
  Widget build(BuildContext context) {
    var adscubit = HomeAdsCubit.get(context);

    return BlocBuilder<HomeAdsCubit, HomeAdsState>(
      builder: (context, state) {
        if (state is HomeAdsLoading) {
          return Column(
            children: const [
              SizedBox(
                height: 200,
              ),
              Center(
                  child: CircularProgressIndicator(
                color: AppColors.defaultColor,
              )),
            ],
          );
        } else if (state is HomeAdsSuccess) {
          return GridView.builder(
            itemCount: adscubit.adsmodel?.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Datum datum = adscubit.adsmodel!.data![index];

              return GestureDetector(
                onTap: () {
                  navigateTo(
                      context,
                      DetailsView(
                          productId:
                              "${HomeAdsCubit.get(context).adsmodel?.data![index].key}"));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        // width: 150.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage("${datum.image}"),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              datum.title ?? " ",
                              style: Theme.of(context).textTheme.bodyLarge,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppSizedBox.sizedH10,
                            Row(
                              children: [
                                const Icon(Icons.person),
                                AppSizedBox.sizedW5,
                                Text(" ${datum.customer?.name ?? ""} "),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                AppSizedBox.sizedW5,
                                Text(" ${datum.city?.name ?? ""} "),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          );
        } else if (state is HomeAdsError) {
          return const Text('Error occurred');
        } else {
          return const Text('Initial state');
        }
      },
    );
  }
}
