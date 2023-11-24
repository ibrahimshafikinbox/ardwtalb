// ignore_for_file: file_names

import 'package:ardwtalab/core/localizations/clasess/app_localization.dart';
import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_Cubit.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_main_appBar extends StatelessWidget {
  const Custom_main_appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        height: 40,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).translate("search"),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bolt,
          ),
        ),
      ],
      // leading: IconButton(
      //   icon: const Icon(Icons.list_sharp),
      //   onPressed: () {},
      // ),
    );
  }
}
