import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Personal_info_Cubit/personal_info_sates.dart';
import 'package:ardwtalab/features/Personal_Accont/data/profile_model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:image_picker/image_picker.dart';

class PersonalCubit extends Cubit<PersonalInfoState> {
  final Dio dio = Dio();
  PersonalCubit() : super(UpdatePersonalInfoInitial());
  static PersonalCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;

  File? profileImage;
  Future<void> getprofileImage(source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {}
  }

  Future<void> updatePrsonalInformation({
    required String firstName,
    required String mobile,
  }) async {
    FormData formData = FormData.fromMap({
      "first_name": firstName,
      "mobile": mobile,
      // "picture": "",
    });
    if (profileImage != null) {
      formData.files.add(MapEntry(
        "picture",
        await MultipartFile.fromFile(profileImage!.path, filename: 'image.jpg'),
      ));
    }
    emit(UpdatePersonalInfoLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio
        .post('${Constants.baseUrl}${Constants.customerProfile}',
            data: formData)
        .then((value) {
      // print(" ${value.data}");
      profileModel = ProfileModel.fromJson(value.data);
      emit(UpdatePersonalInfoSuccess());
      showToast(
          text: "Personal Information Updated successfully",
          state: ToastStates.SUCCESS);
    }).catchError((e) {
      emit(UpdatePersonalInfoError());
      showToast(text: "error , try again ", state: ToastStates.ERROR);

      // print(e.toString());
    });
  }
}
