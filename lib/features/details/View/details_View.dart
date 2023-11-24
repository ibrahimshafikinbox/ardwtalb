// ignore_for_file: file_names

import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/AdComments/View/ad_comments_view.dart';
import 'package:ardwtalab/features/Favorits/Cubit/get_favorite_cubit.dart';
import 'package:ardwtalab/features/Favorits/View/favorite_view.dart';
import 'package:ardwtalab/features/Following/cubit/get_following_cubit.dart';
import 'package:ardwtalab/features/Following/view/Users_following_details_view.dart';
import 'package:ardwtalab/features/Following/view/folllowing_view.dart';
import 'package:ardwtalab/features/chat/Views/ChatRoomView.dart';
import 'package:ardwtalab/features/details/Cubit/details_state.dart';
import 'package:ardwtalab/features/details/Widgets/BottomAppDetails.dart';
import 'package:ardwtalab/features/details/Widgets/TopContainerorderDetails.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/details/Cubit/get_details_cubit.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class DetailsView extends StatefulWidget {
  final String productId;
  const DetailsView({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    DetailsCubit.get(context).getDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context).translate("ad_details"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context).translate("report"),
              style: AppTextStyle.textStyleWhiteMedium,
            ),
          ),
          AppSizedBox.sizedW10,
          IconButton(
              onPressed: () async {
                await Share.share(
                    "${DetailsCubit.get(context).adDetailsModel!.data?.sharingLink}");
              },
              icon: const Icon(
                Icons.share_outlined,
                size: 28,
              ))
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              if (state is DetailsLoading) {
                return const MyIndecator();
              } else if (state is DetailsSuccess) {
                final adDetailsModel =
                    context.watch<DetailsCubit>().adDetailsModel;

                return Expanded(
                  child: ListView(
                    children: [
                      Column(children: [
                        AppSizedBox.sizedH30,
                        Material(
                          child: TopContainerorderDetails(
                            isfavoritecondition:
                                adDetailsModel?.data?.isFavrotied == true,
                            addnumber: '${adDetailsModel?.data?.key ?? "   "}',
                            creatorName:
                                adDetailsModel?.data?.customer?.firstName ??
                                    "   ",
                            location:
                                adDetailsModel?.data?.region?.name ?? "   ",
                            time:
                                '${adDetailsModel?.data?.customer?.createdAt ?? " "}',
                            productName: '${adDetailsModel?.data?.title}',
                            status: adDetailsModel?.data?.adType ?? " ",
                            admodel:
                                adDetailsModel?.data?.admodel?.title ?? " ",
                            requiredphone:
                                adDetailsModel?.data?.mobileNumber ?? "",
                            phoneOnPressed: () {
                              DetailsCubit.get(context).makePhoneCall(
                                  "${adDetailsModel?.data?.mobileNumber}");
                            },
                            addtofavoriteOnPressed: () {
                              FavoritesCubit.get(context)
                                  .addToFavorite(adDetailsModel?.data?.key)
                                  .then((value) {
                                navigateTo(context, const FavoritesView());
                              });
                            },
                            userDetailsOnpress: () {
                              navigateTo(
                                  context,
                                  UsersDetailsView(
                                      userkey:
                                          adDetailsModel?.data?.customer?.key));
                            },
                            openWhatsappOnPress: () {
                              DetailsCubit.get(context).openWhatsApp(
                                  "${adDetailsModel?.data?.mobileNumber}");
                            },
                            openchatOnPress: () {
                              navigateTo(
                                  context,
                                  ChatRoomView(
                                      userId:
                                          "${adDetailsModel?.data?.customer?.id}"));
                            },
                          ),
                        ),
                      ]),
                      BottomAppDetails(
                        adAddress: '${adDetailsModel?.data?.title}',
                        adType: '${adDetailsModel?.data?.adType} ',
                        appSection:
                            '${adDetailsModel?.data?.parentCategory?.title ?? ""} ',
                        area: adDetailsModel?.data?.region?.name ?? "   ",
                        city: "${adDetailsModel?.data?.city?.name} ",
                        price: '${adDetailsModel?.data?.price}',
                        requiredimage: "${adDetailsModel?.data?.image}",
                        adContent: '${adDetailsModel?.data?.content}',
                        commentsonpressed: () {
                          navigateTo(
                            context,
                            AdCommentsView(
                              commentid: widget.productId,
                            ),
                          );
                        },
                        disLikeonpressed: () {
                          DetailsCubit.get(context)
                              .disLike(adDetailsModel?.data!.key);
                        },
                        followsonpressed: () {
                          FollowingCubit.get(context)
                              .follwAds(widget.productId)
                              .then((value) {
                            navigateTo(context, const Following_View());
                          });
                        },
                        likesonpressed: () {
                          DetailsCubit.get(context)
                              .sendLike(adDetailsModel?.data!.key);
                        },
                        followingConditon:
                            adDetailsModel?.data?.isFollowing == true,
                      ),
                    ],
                  ),
                );
              } else if (state is DetailsError) {
                return const Text('Error occurred');
              } else {
                return TextButton(
                    onPressed: () {
                      DetailsCubit.get(context).getDetails(widget.productId);
                    },
                    child: const Text('Try again ! '));
              }
            },
          ),
        ],
      ),
    );
  }
}
