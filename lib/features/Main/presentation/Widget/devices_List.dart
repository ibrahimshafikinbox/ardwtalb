// ignore_for_file: file_names

import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_Cubit.dart';
import 'package:ardwtalab/features/Main/data/Models/devices_parent_model/devices_data.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  String _selectedItem = ' ';

  @override
  Widget build(BuildContext context) {
    var devicesCubit = GetDepartmentCubit.get(context);
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: devicesCubit.devicesParentModell!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          // CarParentData carParentData =
          //     GetDepartmentCubit.get(context).carParentModel!.data![index];
          DevicesData devicesData =
              devicesCubit.devicesParentModell!.data![index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildItem(devicesData.title ?? " value"),
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