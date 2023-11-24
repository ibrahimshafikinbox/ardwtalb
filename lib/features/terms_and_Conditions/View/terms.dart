import 'package:ardwtalab/core/helper/filter_text_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/core/widget/insdecator.dart';

import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:ardwtalab/features/terms_and_Conditions/cubit/pterms_cubit.dart';
import 'package:ardwtalab/features/terms_and_Conditions/cubit/terms_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionView extends StatefulWidget {
  const TermsAndConditionView({super.key});

  @override
  State<TermsAndConditionView> createState() => _TermsAndConditionViewState();
}

class _TermsAndConditionViewState extends State<TermsAndConditionView> {
  @override
  void initState() {
    super.initState();
    TermsCubit.get(context).getTerms();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String filteredTextterms = filterArabicText(
        "${TermsCubit.get(context).TermsModel?.data?.content}");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("terms"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              TermsCubit.get(context).getTerms();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<TermsCubit, TermsState>(
            builder: (context, state) {
              if (state is GetTermsLoading) {
                return const MyIndecator();
              } else if (state is GetTermsSuccess) {
                return Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filterArabicText(
                              "${TermsCubit.get(context).TermsModel?.data?.content}"),
                          style: AppTextStyle.textStyleMediumBlack,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GetTermsError) {
                return TextButton(
                  onPressed: () {},
                  child: const Text("try again"),
                );
              } else {
                return TextButton(
                  onPressed: () {},
                  child: const Text("refresh"),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
