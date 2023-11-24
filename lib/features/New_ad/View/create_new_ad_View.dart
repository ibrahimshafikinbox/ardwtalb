import 'dart:io';

import 'package:ardwtalab/core/helper/image_helper.dart';
import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ardwtalab/core/helper/navigation_helper.dart';
import 'package:ardwtalab/features/Login/View/Widget/Custom_Form_Field.dart';
import 'package:ardwtalab/features/Login/View/Widget/custom_bottom..dart';
import 'package:ardwtalab/features/Login/View/Widget/remeber_container.dart';
import 'package:ardwtalab/features/New_ad/Models/app_departments_Model.dart';
import 'package:ardwtalab/features/New_ad/new_ad_Cubit/new_ad_cubit.dart';
import 'package:ardwtalab/features/New_ad/new_ad_Cubit/new_ad_state.dart';
import 'package:ardwtalab/features/New_ad/Models/region_model.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:ardwtalab/features/resources/styles/app_sized_box.dart';
import 'package:ardwtalab/features/resources/styles/app_text_style.dart';
import 'package:ardwtalab/features/terms_and_Conditions/View/terms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class NewAdView extends StatefulWidget {
  const NewAdView({super.key});

  @override
  State<NewAdView> createState() => _NewAdViewState();
}

class _NewAdViewState extends State<NewAdView> {
  List<String> adTypes = ['demand', 'supply', 'leave'];
  String? selectedAdTypes; // Set initial value

  //
  var adTitleArabicController = TextEditingController();
  var adTitleEnglishController = TextEditingController();
  var priceController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var adContentArabicController = TextEditingController();
  var adContentEnglishController = TextEditingController();
  var cityKeyController = TextEditingController();
  var regionKeyController = TextEditingController();
  var adTypeKeyController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  List<DropDownData>? regions;
  DropDownData? selectedRegion;
  Cities? selectedCity;
  // app department
  List<AppDepartmentData>? departs;
  AppDepartmentData? selectedsepartment;
  ParentCategories? selectedSubdepartment;

  @override
  void initState() {
    super.initState();
    CreateNewAdCubit.get(context).getAppDepartment().then((data) {
      setState(() {
        departs = data;
      });
    });
    CreateNewAdCubit.get(context).getRegions().then((data) {
      setState(() {
        regions = data;
      });
    });
    CreateNewAdCubit.get(context).getAppDepartment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("new_ad"),
        ),
        centerTitle: false,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            AppSizedBox.sizedH25,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate("add_new_ad"),
                    style: AppTextStyle.textStyleMediumGray15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<AppDepartmentData>(
                    value: selectedsepartment,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select section ';
                      }
                      return null; // Return null if the value is valid
                    },
                    onChanged: (AppDepartmentData? newValue) {
                      setState(() {
                        selectedsepartment = newValue;
                        selectedSubdepartment = null;
                      });
                    },
                    items: departs?.map((region) {
                      return DropdownMenuItem<AppDepartmentData>(
                        value: region,
                        child: Text(region.title ?? ""),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate("select_sec"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 240, 237, 237),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)
                                .translate("commission"),
                            style: AppTextStyle.textStyleMediumBlack,
                          ),
                          const Text('الفتره الحاليه مجانيه بدون عموله')
                        ],
                      ),
                    ),
                  ),
                ),
                // const ConfirmBox(
                //     text: "I pledge to agree to the commission agreement"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<DropDownData>(
                    value: selectedRegion,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Region ';
                      }
                      return null; // Return null if the value is valid
                    },
                    onChanged: (DropDownData? newValue) {
                      setState(() {
                        regionKeyController.text =
                            newValue?.key?.toString() ?? '';

                        selectedRegion = newValue;
                        selectedCity = null;
                      });
                    },
                    items: regions?.map((region) {
                      return DropdownMenuItem<DropDownData>(
                        value: region,
                        child: Text(region.name ?? ""),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .translate("select_region"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                AppSizedBox.sizedH20,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<Cities>(
                    value: selectedCity,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select City ';
                      }
                      return null; // Return null if the value is valid
                    },
                    onChanged: (Cities? newValue) {
                      setState(() {
                        selectedCity = newValue;
                        cityKeyController.text =
                            newValue?.key?.toString() ?? '';
                      });
                    },
                    items: (selectedRegion?.cities ?? [])
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      Cities city = entry.value;
                      return DropdownMenuItem<Cities>(
                        key: Key(index.toString()), // Unique key for each item
                        value: city,
                        child: Text(city.name ?? ""),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate("select_city"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),

                AppSizedBox.sizedH10,
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).translate("ad_image"),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext cont) {
                              return CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      CreateNewAdCubit.get(context)
                                          .getAdImage(ImageSource.camera);
                                    },
                                    child: const Text('Use Camera'),
                                  ),
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      CreateNewAdCubit.get(context)
                                          .getAdImage(ImageSource.gallery);
                                    },
                                    child: const Text('Upload from files'),
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.of(cont).pop;
                                  },
                                  child: const Text('Cancel',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              );
                            });
                      },
                      child: Image.asset(AppImages.newImage),
                    ),
                    if (CreateNewAdCubit.get(context).AdImage != null)
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            File(CreateNewAdCubit.get(context).AdImage?.path ??
                                ""),
                          ),
                        ),
                      ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedAdTypes,
                    validator: (value) {
                      if (value == null) {
                        return 'Ad Type Is Required  ';
                      }
                      return null; // Return null if the value is valid
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAdTypes = newValue!;
                        adTypeKeyController.text = newValue;
                      });
                    },
                    items: adTypes.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate("ad_type"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: adTitleArabicController,
                    type: TextInputType.emailAddress,
                    label:
                        AppLocalizations.of(context).translate("ad_title_ar"),
                    hint: '',
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: adTitleEnglishController,
                    type: TextInputType.emailAddress,
                    label:
                        AppLocalizations.of(context).translate("ad_title_en"),
                    hint: '',
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<AppDepartmentData>(
                    value: selectedsepartment,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select MAin Section ';
                      }
                      return null; // Return null if the value is valid
                    },
                    onChanged: (AppDepartmentData? newValue) {
                      setState(() {
                        selectedsepartment = newValue;
                        selectedSubdepartment = null;
                      });
                    },
                    items: departs?.map((region) {
                      return DropdownMenuItem<AppDepartmentData>(
                        value: region,
                        child: Text(region.title ?? ""),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate("main_sec"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                // "add_new_ad": "أضف إعلانًا جديدًا باستخدام هذه البيانات",
//    "select_sec": "اختر قسم التطبيق",
//    "commission": "العمولة المتكبدة",
//    "select_region": "اختر المنطقة",
//    "select_city": "اختر المدينة",
//    "ad_image": "صورة الإعلان",
//    "ad_title_ar": "عنوان الإعلان بالعربية",
//    "ad_title_en": "عنوان الإعلان بالإنجليزية",
//    "main_sec": "القسم الرئيسي",
//    "sub_sec": "القسم الفرعي",
//    "price": "السعر",
//    "ad_content_ar": "محتوى الإعلان بالعربية",
//    "ad_content_en": "محتوى الإعلان بالإنجليزية",
//    "i_confirm_about": "أؤكد حول",
//    "new_ad": "إعلان جديد",
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<ParentCategories>(
                    value: selectedSubdepartment,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select Sub section ';
                      }
                      return null; // Return null if the value is valid
                    },
                    onChanged: (ParentCategories? newValue) {
                      setState(() {
                        selectedSubdepartment = newValue;
                      });
                    },
                    items: (selectedsepartment?.parentCategories ?? [])
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      ParentCategories parent = entry.value;
                      return DropdownMenuItem<ParentCategories>(
                        key: Key(index.toString()), // Unique key for each item
                        value: parent,
                        child: Text(parent.title ?? ""),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).translate("sub_sec"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: priceController,
                    type: TextInputType.emailAddress,
                    label: AppLocalizations.of(context).translate("price"),
                    hint: '',
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: phoneNumberController,
                    type: TextInputType.emailAddress,
                    label: "Phone Number  ",
                    hint: '',
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: adContentArabicController,
                    type: TextInputType.emailAddress,
                    label:
                        AppLocalizations.of(context).translate("ad_content_ar"),
                    hint: '',
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultFormField(
                    controller: adContentEnglishController,
                    type: TextInputType.emailAddress,
                    label:
                        AppLocalizations.of(context).translate("ad_content_en"),
                    hint: '',
                    suffixPressed: () {},
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'reqired';
                      }
                      return null;
                    },
                    lines: 5,
                  ),
                ),
                AppSizedBox.sizedH10,
                Row(
                  children: [
                    ConfirmBox(
                      text: AppLocalizations.of(context)
                          .translate("i_confirm_about"),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateTo(context, const TermsAndConditionView());
                      },
                      child: Text(
                        AppLocalizations.of(context).translate("terms"),
                        style: AppTextStyle.textStyleRegulargreenLight15,
                      ),
                    ),
                  ],
                ),

                AppSizedBox.sizedH45,

                BlocBuilder<CreateNewAdCubit, CreateNewAdState>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! CreateNewAdLoading,
                      builder: (BuildContext context) => DefaultButton(
                        text:
                            AppLocalizations.of(context).translate("create_ad"),
                        function: () {
                          if (formKey.currentState!.validate() &&
                              regionKeyController.text.isNotEmpty &&
                              cityKeyController.text.isNotEmpty) {
                            CreateNewAdCubit.get(context).createNewAd(
                              titleArabic: adTitleArabicController.text,
                              titleEnglish: adTitleEnglishController.text,
                              contentArabic: adContentArabicController.text,
                              contentEnglish: adContentEnglishController.text,
                              price: priceController.text,
                              mobile: phoneNumberController.text,
                              adType: adTypeKeyController.text,
                              cityId: cityKeyController.text,
                              regionId: regionKeyController.text,
                            );
                          }
                        },
                      ),
                      fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.defaultColor,
                      )),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
