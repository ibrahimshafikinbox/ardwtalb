import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/Following/cubit/get_folllowing_state.dart';
import 'package:ardwtalab/features/Following/cubit/get_following_cubit.dart';
import 'package:ardwtalab/features/My_Ads/Widgets/AdsBuilderWidget.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsFollowing extends StatefulWidget {
  const AdsFollowing({super.key});

  @override
  State<AdsFollowing> createState() => _AdsFollowingState();
}

class _AdsFollowingState extends State<AdsFollowing> {
  @override
  void initState() {
    super.initState();
    FollowingCubit.get(context).getFollowingAds();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FollowingCubit, FollowingState>(
          builder: (context, state) {
            if (state is GetFollowingAdsLoading) {
              return const MyIndecator();
            } else if (state is GetFollowingAdsSuccess) {
              return ListView.builder(
                  itemCount: FollowingCubit.get(context)
                      .followingAdsModel
                      ?.data
                      ?.length,
                  shrinkWrap: true,
                  itemBuilder: ((BuildContext context, int index) {
                    var adsfollowingdata = FollowingCubit.get(context)
                        .followingAdsModel
                        ?.data![index];
                    if (FollowingCubit.get(context)
                            .followingAdsModel
                            ?.data
                            ?.length !=
                        0) {
                      return AdsBuilderWidget(
                        image: adsfollowingdata?.image ?? "",
                        title: adsfollowingdata?.title ?? "",
                        createdat: "${adsfollowingdata?.createdAt ?? ""}",
                        city: adsfollowingdata?.city?.name ?? "",
                        name: adsfollowingdata?.customer?.name ?? "",
                      );
                    } else
                      return Text("empty");
                  }));
            } else if (state is GetFollowingAdsError) {
              return const Text('Error occurred');
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "retry",
                    style: AppTextStyle.textStyleSemiBoldRed,
                  ),
                  IconButton(
                    onPressed: () {
                      FollowingCubit.get(context).getFollowingAds();
                    },
                    icon: const Icon(
                      Icons.restart_alt_outlined,
                      size: 25,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
