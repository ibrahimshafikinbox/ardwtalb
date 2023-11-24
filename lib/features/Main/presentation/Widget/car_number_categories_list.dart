import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_Cubit.dart';
import 'package:ardwtalab/features/resources/colors/colors.dart';
import 'package:flutter/material.dart';

class CarNumberCategorieslist extends StatefulWidget {
  const CarNumberCategorieslist({super.key});

  @override
  State<CarNumberCategorieslist> createState() =>
      _CarNumberCategorieslistState();
}

class _CarNumberCategorieslistState extends State<CarNumberCategorieslist> {
  String _selectedItem = ' ';

  @override
  Widget build(BuildContext context) {
    var carnumbercubit = GetDepartmentCubit.get(context);
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:
            GetDepartmentCubit.get(context).carsNumberModel!.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildItem(
                carnumbercubit.carsNumberModel!.data![index] ?? " value"),
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
