import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/Change_Password/cubit/change_pass_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordtate> {
  final Dio _dio = Dio();

  ChangePasswordCubit() : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    _dio.options.headers['Authorization'] = Constants.token;

    FormData formData = FormData.fromMap({
      "old_password": oldPassword,
      "new_password": newPassword,
      "new_password_confirmation": confirmNewPassword,
    });

    emit(ChangePasswordLoading());
    await _dio
        .post(
      "${Constants.baseUrl}${Constants.changePassword}",
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'ar',
        },
      ),
    )
        .then((value) {
      emit(ChangePasswordSuccess());
      // print(value.data);
      showToast(
          text: "Changed Password Successfully", state: ToastStates.SUCCESS);
    }).catchError((onError) {
      // print(onError.toString());

      showToast(
          text: "there was an error , check informations ",
          state: ToastStates.ERROR);
    });
  }
}
