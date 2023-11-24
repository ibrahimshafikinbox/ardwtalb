import 'package:dio/dio.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/Privacy/cubit/privacy_state.dart';
import 'package:ardwtalab/features/Privacy/data/privacy_model/privacy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyCubit extends Cubit<PrivacyState> {
  PrivacyCubit() : super(GetPrivacyInitial());
  static PrivacyCubit get(context) => BlocProvider.of(context);
  PrivacyModel? privacyModel;

  final Dio dio = Dio();
  Future<void> getprivacy() async {
    emit(GetPrivacyLoading());
    await dio.get("${Constants.baseUrl}${Constants.privacy}").then((value) {
      print(value.data);
      privacyModel = PrivacyModel.fromJson(value.data);
      print(privacyModel?.data?.key);
      emit(GetPrivacySuccess());
    }).catchError((e) {
      print(e.toString());
      emit(GetPrivacyError());
    });
  }
}
