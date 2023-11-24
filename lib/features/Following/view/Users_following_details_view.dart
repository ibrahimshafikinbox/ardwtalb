// ignore_for_file: file_names

import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/helper/url_luncher_he;per.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Following/widget/Users/CustomerData.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/chat/Views/ChatRoomView.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/features/Following/cubit/get_folllowing_state.dart';
import 'package:ardwtalab/features/Following/cubit/get_following_cubit.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class UsersDetailsView extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final userkey;
  const UsersDetailsView({
    Key? key,
    required this.userkey,
  }) : super(key: key);

  @override
  State<UsersDetailsView> createState() => _UsersDetailsViewState();
}

class _UsersDetailsViewState extends State<UsersDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FollowingCubit.get(context).getUserFollowingDetails(widget.userkey);
    });
  }

  var ratcontroller = TextEditingController();
  var commentController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userdetails = FollowingCubit.get(context).customerDetailsModel?.data;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Share.share("${userdetails?.sharingLink}");
            },
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            BlocBuilder<FollowingCubit, FollowingState>(
              builder: (context, state) {
                if (state is GetUserFollowingDetailsLoadingstate) {
                  return Column(
                    children: const [
                      SizedBox(
                        height: 200,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (state is GetUserFollowingDetailsSuccessstate) {
                  var userdetails =
                      FollowingCubit.get(context).customerDetailsModel?.data;
                  DateTime dateTime =
                      DateTime.parse("${userdetails?.accountVerifiedAt}");
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(dateTime);

                  return CustomerData(
                    Fullname: "${userdetails?.fullName}",
                    createdat: 'created at : $formattedDate',
                    ratingvalue: userdetails?.rating?.toDouble(),
                    avatar: "${userdetails?.avatar}",
                    phonenumber: userdetails?.mobile ?? "",
                    conditionn: userdetails?.isFollowing == true,
                    followonpressed: () {
                      FollowingCubit.get(context)
                          .followAndUnfollowUSer(userdetails?.key);
                    },
                    addRatingOnPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              AppSizedBox.sizedH20,
                              Text(
                                AppLocalizations.of(context)
                                    .translate("add_user_rating"),
                                style: AppTextStyle.textStyleBoldBlack,
                              ),
                              AppSizedBox.sizedH10,
                              Text(
                                AppLocalizations.of(context)
                                    .translate("add_user_rating_latest"),
                                style: AppTextStyle.textStyleMediumGray15,
                              ),
                              AppSizedBox.sizedH25,
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 50.0,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star_border_rounded,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    ratcontroller.text =
                                        rating.toInt().toString();
                                  });
                                },
                                tapOnlyMode: true,
                                unratedColor: Colors.grey,
                              ),
                              AppSizedBox.sizedH40,
                              DefaultButton(
                                function: () {
                                  FollowingCubit.get(context)
                                      .rateOtherCustomers(
                                          userdetails?.key, ratcontroller.text);
                                },
                                text: 'send',
                              ),
                            ],
                          );
                        },
                      );
                    },
                    makeChatOnpress: () {
                      navigateTo(
                          context, ChatRoomView(userId: "${userdetails?.key}"));
                    },
                    makecallonpress: () {
                      makePhoneCall(userdetails?.mobile);
                    },
                  );
                } else if (state is GetUserFollowingDetailsErrorstate) {
                  return const Text('Error occurred');
                } else {
                  return const Text('Initial state');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
