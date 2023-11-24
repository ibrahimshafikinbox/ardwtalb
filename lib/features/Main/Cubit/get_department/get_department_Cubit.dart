// ignore_for_file: file_names

import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/Main/Cubit/get_department/get_department_State.dart';
import 'package:ardwtalab/features/Main/data/Models/car_parent_model/car_parent_model.dart';
import 'package:ardwtalab/features/Main/data/Models/cars_number_model.dart';
import 'package:ardwtalab/features/Main/data/Models/department_model/department_model.dart';
import 'package:ardwtalab/features/Main/data/Models/devices_parent_model/devices_parent_model.dart';
import 'package:ardwtalab/features/Main/data/Models/real_state_parent_model/real_state_parent_model.dart';
import 'package:ardwtalab/features/Main/data/Models/vans_parent_model/vans_parent_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetDepartmentCubit extends Cubit<GetDepartmentStates> {
  final Dio dio = Dio();
  DepartmentModel? departmentModel;
  CarParentModel? carParentModel;
  VansParentModel? vansParentModel;
  RealStateParentModel? realStateParentModel;
  DevicesParentModel? devicesParentModell;
  CarsNumberModel? carsNumberModel;

  GetDepartmentCubit() : super(GetDepartmentInitial());
  static GetDepartmentCubit get(context) => BlocProvider.of(context);
  // get department
  Future<void> getdepartment() async {
    emit(GetDepartmentLoading());
    await dio.get('${Constants.baseUrl}${Constants.department}').then((value) {
      // print(value.data);
      departmentModel = DepartmentModel.fromJson(value.data);
      // print(departmentModel?.data?.length);

      emit(GetDepartmentSuccess());
    }).catchError((onError) {
      // print(
      //   onError.toString(),
      // );
    });
  }

// get parent categories for cars

  Future<void> getCareparentcategories() async {
    await dio
        .get('${Constants.baseUrl}${Constants.parentCategoriescars}')
        .then((value) {
      // print(value.data);
      carParentModel = CarParentModel.fromJson(value.data);
      // print(carParentModel!.data!.length);
    }).catchError((onError) {
      // print(
      //   onError.toString(),
      // );
    });
  }

//get parent categories for Vans

  Future<void> getVansparentcategories() async {
    await dio
        .get('${Constants.baseUrl}${Constants.prentCategoeiesVans}')
        .then((value) {
      // print(value.data);
      vansParentModel = VansParentModel.fromJson(value.data);
      // print(vansParentModel!.data!.length);
    }).catchError((onError) {
      // print(
      //   onError.toString(),
      // );
    });
  }

  //get parent categories for Real_State

  Future<void> getRealStateparentcategories() async {
    await dio
        .get('${Constants.baseUrl}${Constants.prentCategoeiesRealState}')
        .then((value) {
      // print(value.data);
      realStateParentModel = RealStateParentModel.fromJson(value.data);
      // print(realStateParentModel!.data!.length);
    }).catchError((onError) {
      // print(
      //   onError.toString(),
      // );
    });
  }
  //get parent categories for Devices

  Future<void> getDevicesparentcategories() async {
    await dio
        .get('${Constants.baseUrl}${Constants.parentCategoriesDevices}')
        .then((value) {
      // print(value.data);
      devicesParentModell = DevicesParentModel.fromJson(value.data);
    }).catchError((onError) {
      // print(
      //   onError.toString(),
      // );
    });
  }
  //get parent categories for Car Numbers

  Future<void> getcarNumbersparentcategories() async {
    await dio
        .get('${Constants.baseUrl}${Constants.parentCategoriescarNumbers}')
        .then((value) {
      // print(value.data);
      carsNumberModel = CarsNumberModel.fromJson(value.data);
      // print("💙💛💙💛${carsNumberModel!.data!.length}");
    }).catchError((onError) {
      // print(
      //   onError.toString(),
      // );
    });
  }
}
