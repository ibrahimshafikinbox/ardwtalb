import 'package:ardwtalab/core/helper/filter_text_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';
import 'package:ardwtalab/features/Privacy/cubit/privacy_cubit.dart';
import 'package:ardwtalab/features/Privacy/cubit/privacy_state.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  void initState() {
    super.initState();
    PrivacyCubit.get(context).getprivacy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("privacy")),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<PrivacyCubit, PrivacyState>(
            builder: (context, state) {
              if (state is GetPrivacyLoading) {
                return const MyIndecator();
              } else if (state is GetPrivacySuccess) {
                return Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filterArabicText(
                              "${PrivacyCubit.get(context).privacyModel?.data?.content}"),
                          style: AppTextStyle.textStyleMediumBlack,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GetPrivacyError) {
                return const Text('Error occurred');
              } else {
                return const Text('Initial state');
              }
            },
          ),
        ],
      ),
    );
  }
}
