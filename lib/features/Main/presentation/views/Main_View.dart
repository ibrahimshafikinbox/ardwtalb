// ignore_for_file: file_names

import 'package:ardwtalab/features/Main/Cubit/home_ads/home_Ads_Cubit.dart';
import 'package:ardwtalab/features/Main/Cubit/home_ads/home_ads_state.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/Custom_main_appBar.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/ProductCard_builder.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/custom_drawer_widget.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/grid_view.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/my_gategory_itms.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Main_View extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Main_View({Key? key});

  @override
  State<Main_View> createState() => _Main_ViewState();
}

// ignore: camel_case_types
class _Main_ViewState extends State<Main_View> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  bool _isListView = true; // Track the current view selecti

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeAdsCubit, HomeAdsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const CustomDrawerWidget(),
          body: Column(
            children: [
              const SizedBox(
                height: 120,
                child: Center(
                  child: Custom_main_appBar(),
                ),
              ),
              const SizedBox(
                height: 150,
                child: MyItemCategory(),
              ),
              // const Place_And_City(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isListView = true; // Switch to list view
                        });
                      },
                      icon: _isListView
                          ? Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.defaultColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.list_outlined,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.list),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isListView = false; // Switch to grid view
                        });
                      },
                      icon: _isListView
                          ? const Icon(Icons.grid_view)
                          : Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.defaultColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.grid_view,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _isListView
                    ? const ProductCardList()
                    : const ProductCardGrid(),
              ),
            ],
          ),
        );
      },
    );
  }
}
