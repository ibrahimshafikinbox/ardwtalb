// ignore_for_file: file_names

import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/New_ad/View/create_new_ad_View.dart';
import 'package:ardwtalab/features/layout/cubit/cubit.dart';
import 'package:ardwtalab/features/layout/cubit/status.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],

            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 12,
              child: SizedBox(
                height: 80,
                child: BottomNavigationBar(
                  elevation: 0,
                  onTap: (index) {
                    AppCubit.get(context).changeBottomNav(index);
                  },
                  currentIndex: AppCubit.get(context).currentIndex,
                  selectedItemColor: Colors.red[800],
                  unselectedItemColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.home_outlined,
                        ),
                        label: AppLocalizations.of(context).translate("home")),
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.supervised_user_circle_sharp,
                        ),
                        label: AppLocalizations.of(context)
                            .translate("following")),
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.notifications_outlined,
                        ),
                        label: AppLocalizations.of(context)
                            .translate("notification")),
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.person_outline_outlined,
                        ),
                        label: AppLocalizations.of(context).translate("acc")),
                    BottomNavigationBarItem(
                        icon: const Icon(
                          Icons.chat_outlined,
                        ),
                        label: AppLocalizations.of(context).translate("chats")),
                  ],
                ),
              ),
            ),
            //
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,

            floatingActionButton: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 70,
                width: 60,
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    navigateTo(context, const NewAdView());
                  },
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
