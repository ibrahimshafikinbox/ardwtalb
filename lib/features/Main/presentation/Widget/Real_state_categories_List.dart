// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_Cubit.dart';
import 'package:ardwtalab/features/Main/data/Models/real_state_parent_model/datum.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';

class RealState_Categories_List extends StatefulWidget {
  const RealState_Categories_List({super.key});

  @override
  _MyVans_Categories_ListState createState() => _MyVans_Categories_ListState();
}

class _MyVans_Categories_ListState extends State<RealState_Categories_List> {
  String _selectedItem = ' ';

  @override
  Widget build(BuildContext context) {
    var realstateCubit = GetDepartmentCubit.get(context);
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: realstateCubit.realStateParentModel?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          RealStateParentData realStateParentData =
              realstateCubit.realStateParentModel!.data![index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildItem(realStateParentData.title ?? " value"),
          );
        });
  }

  Widget _buildItem(String label) {
    bool isSelected = (label == _selectedItem);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.defaultColor : Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
