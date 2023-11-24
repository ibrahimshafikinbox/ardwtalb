import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Account_Cubit/account_states.dart';
import 'package:ardwtalab/features/Personal_Accont/widget/ProfileCardWidget.dart';
import 'package:flutter/material.dart';

import 'package:ardwtalab/features/Personal_Accont/cubit/Account_Cubit/account_cubit.dart';
import 'package:ardwtalab/features/Personal_Accont/widget/ProfileOptionsWidget.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    super.initState();
    AccountCubit.get(context).getAccount().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("acc")),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                AccountCubit.get(context).getAccount();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        // body

        body: ListView(
          children: [
            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                if (state is GetAccountLoading) {
                  return const MyIndecator();
                } else if (state is GetAccountSuccess) {
                  var userdata = AccountCubit.get(context).profileModel?.data;
                  return Column(
                    children: [
                      ProfileCardWidget(
                        createdAt: userdata?.accountVerifiedAt ?? "",
                        image: '${userdata?.avatar}',
                        name: userdata?.fullName ?? "empty",
                        ratingvalue: userdata?.rating ?? 1,
                      ),
                    ],
                  );
                } else if (state is GetAccountError) {
                  return const Text('Error occurred');
                } else {
                  return const Text('Initial state');
                }
              },
            ),
            AppSizedBox.sizedH30,
            const ProfileOptionWidget(),
          ],
        ));
  }
}
