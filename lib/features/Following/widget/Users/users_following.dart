import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/Following/cubit/get_folllowing_state.dart';
import 'package:ardwtalab/features/Following/cubit/get_following_cubit.dart';
import 'package:ardwtalab/features/Following/view/Users_following_details_view.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:ardwtalab/features/Following/widget/Users/user_details_build_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersFollowing extends StatefulWidget {
  const UsersFollowing({super.key});

  @override
  State<UsersFollowing> createState() => _UsersFollowingState();
}

class _UsersFollowingState extends State<UsersFollowing> {
  @override
  void initState() {
    super.initState();
    FollowingCubit.get(context).getFollowingUsers();
  }
  //            "ads": "الإعلانات",
  //  "no_user_following": "لا يوجد متابعون",
  //  "notification": "الإشعارات",
  //  "no_notifications": "لا يوجد إشعارات",
  //  "we_will_notify": "سنخطرك عند وجود شيء جديد"

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FollowingCubit, FollowingState>(
          builder: (context, state) {
            if (state is FollowingLoading) {
              return const MyIndecator();
            } else if (state is FollowingSuccess) {
              return FollowingCubit.get(context)
                          .followingUserModel
                          ?.data
                          ?.isNotEmpty ==
                      true
                  ? Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: FollowingCubit.get(context)
                              .followingUserModel
                              ?.data
                              ?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final followinguser = context
                                .watch<FollowingCubit>()
                                .followingUserModel
                                ?.data![index];
                            return UserDetailsBuildSWidget(
                              onpressed: () {
                                navigateTo(
                                  context,
                                  UsersDetailsView(
                                    userkey: followinguser?.key,
                                  ),
                                );
                              },
                              image: "${followinguser?.avatar}",
                              name: followinguser?.fullName ?? "empty ",
                              ratingvalue: followinguser?.rating?.toDouble(),
                            );
                          }),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppSizedBox.sizedH60,
                        const Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 64,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          AppLocalizations.of(context)
                              .translate("no_user_following"),
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    );
            } else if (state is FollowingError) {
              return const Text('Error occurred');
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      FollowingCubit.get(context).getFollowingUsers();
                    },
                    icon: const Icon(
                      Icons.restart_alt_outlined,
                      size: 50,
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
