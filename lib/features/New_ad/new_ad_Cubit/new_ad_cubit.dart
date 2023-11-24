import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/New_ad/Models/app_departments_Model.dart';
import 'package:ardwtalab/features/New_ad/Models/region_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ardwtalab/features/New_ad/new_ad_Cubit/new_ad_state.dart';

class CreateNewAdCubit extends Cubit<CreateNewAdState> {
  final ImageSource source;

  final Dio dio = Dio();
  DropDownModel? drobdownModel;
  AppDepartmentsModel? appDepartmentsModel;

  CreateNewAdCubit(
    this.source,
  ) : super(CreateNewAdInitial());
  static CreateNewAdCubit get(context) => BlocProvider.of(context);

  File? AdImage;
  Future<void> getAdImage(source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    emit(PickedImagesuccess());
    if (pickedFile != null) {
      AdImage = File(pickedFile.path);
    } else {
      // print("no image selected");
    }
  }

  Future<void> createNewAd({
    required String titleArabic,
    required String titleEnglish,
    required String contentArabic,
    required String contentEnglish,
    required String price,
    required String mobile,
    required String adType,
    required cityId,
    required regionId,
  }) async {
    dio.options.headers['Authorization'] = Constants.token;

    FormData formData = FormData.fromMap({
      "title_ar": titleArabic,
      "title_en": titleEnglish,
      "department_id": "1",
      "parent_category_id": "1",
      "sub_category_id": "3",
      "region_id": regionId,
      "city_id": cityId,
      "admodel_id": "1",
      "allow_comments": 1,
      "show_mobile": 1,
      "content_ar": contentArabic,
      "content_en": contentEnglish,
      "mobile_number": mobile,
      "price": price,
      "ad_type": adType,
    });

    if (AdImage != null) {
      formData.files.add(MapEntry(
        "pics[]",
        await MultipartFile.fromFile(AdImage!.path, filename: 'image.jpg'),
      ));
    }
    emit(CreateNewAdLoading());
    await dio
        .post(
      "${Constants.baseUrl}${Constants.createNewAd}",
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
        },
      ),
    )
        .then((value) {
      emit(CreateNewAdSuccess());
      print(value.data);
      showToast(text: "create ad Succefully", state: ToastStates.SUCCESS);
    }).catchError((onError) {
      print(onError.toString());

      showToast(
          text: "there was an error , try again", state: ToastStates.ERROR);
    });
  }

  Future<List<DropDownData>> getRegions() async {
    try {
      final response = await Dio().get(
        "${Constants.baseUrl}${Constants.regionWithCities}",
      );

      print(response.data);
      DropDownModel dropDownModel = DropDownModel.fromJson(response.data);
      List<DropDownData> regionData = dropDownModel.data ?? [];

      return regionData;
    } catch (error) {
      throw Exception("Failed to load regions: $error");
    }
  }

  Future<List<AppDepartmentData>> getAppDepartment() async {
    // emit(GetDepartmentLoading());
    try {
      final response = await Dio().get(
        "${Constants.baseUrl}/get-departments",
      );

      print(response.data);
      AppDepartmentsModel appDepartmentsModel =
          AppDepartmentsModel.fromJson(response.data);
      List<AppDepartmentData> appdepartmentData =
          appDepartmentsModel.data ?? [];
      // emit(GetDepartmentSuccess());

      return appdepartmentData;
    } catch (error) {
      // emit(GetDepartmentError());
      throw Exception("Failed to load regions: $error");
    }
  }

  Future<void> getCommession() async {
    await dio.get("path").then((value) {
      print(value.data);
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
