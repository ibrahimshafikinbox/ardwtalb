// ignore_for_file: camel_case_types

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Following/cubit/get_following_cubit.dart';
import 'package:ardwtalab/features/Following/widget/ads/ads_following.dart';
import 'package:ardwtalab/features/Following/widget/Users/users_following.dart';
import 'package:flutter/material.dart';

// ignore:
class Following_View extends StatefulWidget {
  const Following_View({super.key});

  @override
  State<Following_View> createState() => _Following_ViewState();
}

class _Following_ViewState extends State<Following_View> {
  @override
  void initState() {
    super.initState();
    FollowingCubit.get(context).getFollowingUsers();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).translate("following"),
          ),
          centerTitle: false,
          bottom: TabBar(
            tabs: [
              Tab(
                text: AppLocalizations.of(context).translate("users"),
              ),
              Tab(
                text: AppLocalizations.of(context).translate("ads"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UsersFollowing(),
            AdsFollowing(),
          ],
        ),
      ),
    );
  }
}
