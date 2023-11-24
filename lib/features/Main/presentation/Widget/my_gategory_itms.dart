// ignore_for_file: library_private_types_in_public_api

import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_Cubit.dart';
import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_State.dart';
import 'package:ardwtalab/features/Main/data/Models/department_model/datum.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/Car_categories_List.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/Real_state_categories_List.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/Vans_Categories_List.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/car_number_categories_list.dart';
import 'package:ardwtalab/features/Main/presentation/Widget/devices_List.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyItemCategory extends StatefulWidget {
  const MyItemCategory({super.key});

  @override
  _MyItemCategoryState createState() => _MyItemCategoryState();
}

class _MyItemCategoryState extends State<MyItemCategory> {
  String _selectedItem = ' ';
  @override
  void initState() {
    super.initState();
    GetDepartmentCubit.get(context).getdepartment();
    GetDepartmentCubit.get(context).getCareparentcategories();
    GetDepartmentCubit.get(context).getVansparentcategories();
    GetDepartmentCubit.get(context).getRealStateparentcategories();
    GetDepartmentCubit.get(context).getDevicesparentcategories();
  }

  @override
  Widget build(BuildContext context) {
    var departmentcubit = GetDepartmentCubit.get(context);

    return BlocBuilder<GetDepartmentCubit, GetDepartmentStates>(
      builder: (context, state) {
        if (state is GetDepartmentLoading) {
          return const SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.defaultColor,
              ),
            ),
          );
        } else if (state is GetDepartmentSuccess) {
          return Column(
            children: [
              SizedBox(
                height: 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: departmentcubit.departmentModel?.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      Data? departmentdata =
                          departmentcubit.departmentModel?.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: _buildItem(
                              departmentdata?.title ?? " without value"),
                        ),
                      );
                    }),
              ),
              if (_selectedItem == "السيارات")
                const SizedBox(
                  height: 80,
                  child: CarCategoriesList(),
                ),
              if (_selectedItem == "الشاحنات")
                const SizedBox(
                  height: 80,
                  child: Vans_Categories_List(),
                ),
              if (_selectedItem == "العقارات")
                const SizedBox(
                  height: 80,
                  child: RealState_Categories_List(),
                ),
              if (_selectedItem == "الأجهزة")
                const SizedBox(
                  height: 80,
                  child: Devices(),
                ),
              if (_selectedItem == "أرقام سيارات و جوالات")
                const SizedBox(
                  height: 80,
                  child: CarNumberCategorieslist(),
                ),
            ],
          );
        } else if (state is GetDepartmentError) {
          return const Text('Error occurred');
        } else {
          return TextButton(
              onPressed: () {
                GetDepartmentCubit.get(context).getdepartment();
              },
              child: const Text("try again "));
        }
      },
    );
  }

  Widget _buildItem(String label) {
    bool isSelected = (label == _selectedItem);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = label;
        });
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.defaultColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
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
