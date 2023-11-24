import 'dart:io';

import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Login/View/Widget/Custom_Form_Field.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Account_Cubit/account_cubit.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Personal_info_Cubit/personal_info_cubit.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Personal_info_Cubit/personal_info_sates.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({super.key});

  @override
  State<PersonalInformationView> createState() =>
      _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  var nameEnglishController = TextEditingController();
  var namearabicController = TextEditingController();
  var mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var personaldata = AccountCubit.get(context).profileModel?.data;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("personal_info")),
      ),
      body: BlocConsumer<PersonalCubit, PersonalInfoState>(
        listener: (context, state) {
          if (State is UpdatePersonalInfoSuccess) {
            showToast(
                text: "personal information Updated successfully",
                state: ToastStates.SUCCESS);
          } else if (State is UpdatePersonalInfoError) {
            showToast(text: "error ", state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child:
                                PersonalCubit.get(context).profileImage != null
                                    ? Image.file(
                                        File(PersonalCubit.get(context)
                                                .profileImage
                                                ?.path ??
                                            ""),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )
                                    : Image.network(
                                        "${personaldata?.avatar}",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors.defaultColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext cont) {
                                          return CupertinoActionSheet(
                                            actions: [
                                              CupertinoActionSheetAction(
                                                onPressed: () {
                                                  PersonalCubit.get(context)
                                                      .getprofileImage(
                                                          ImageSource.camera);
                                                },
                                                child: const Text('Use Camera'),
                                              ),
                                              CupertinoActionSheetAction(
                                                onPressed: () {
                                                  PersonalCubit.get(context)
                                                      .getprofileImage(
                                                          ImageSource.gallery);
                                                },
                                                child: const Text(
                                                    'Upload from files'),
                                              ),
                                            ],
                                            cancelButton:
                                                CupertinoActionSheetAction(
                                              onPressed: () {
                                                Navigator.of(cont).pop;
                                              },
                                              child: const Text('Cancel',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ),
                                          );
                                        });
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate("edit"),
                                    style: AppTextStyle.textStyleWhiteMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ReadOnlyFormField(
                      requireddata: "${personaldata?.accountVerifiedAt}",
                      requiredtext:
                          AppLocalizations.of(context).translate("craeted_at")),
                  ReadOnlyFormField(
                      requireddata: " ( ${personaldata?.rating} ) ",
                      requiredtext:
                          AppLocalizations.of(context).translate("rating")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultFormField(
                      controller: nameEnglishController,
                      type: TextInputType.emailAddress,
                      label: AppLocalizations.of(context).translate("name"),
                      hint: '',
                      suffixPressed: () {},
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'reqired';
                        }
                        return null;
                      },
                      lines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultFormField(
                      controller: mobileController,
                      type: TextInputType.emailAddress,
                      label: AppLocalizations.of(context).translate("mobile"),
                      hint: '',
                      suffixPressed: () {},
                      onValidate: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'reqired';
                        }
                        return null;
                      },
                      lines: 1,
                    ),
                  ),
                  DefaultButton(
                      function: () {
                        PersonalCubit.get(context).updatePrsonalInformation(
                            firstName: nameEnglishController.text,
                            mobile: mobileController.text);
                      },
                      text: AppLocalizations.of(context).translate("save")),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
