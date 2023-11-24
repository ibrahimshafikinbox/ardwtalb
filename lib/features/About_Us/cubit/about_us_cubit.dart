import 'package:dio/dio.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/About_Us/cubit/about_us_state.dart';
import 'package:ardwtalab/features/About_Us/data/terms_and_conditons_model/terms_and_conditons_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUSCubit extends Cubit<AboutUSState> {
  AboutUSCubit() : super(GetAboutUSInitial());
  static AboutUSCubit get(context) => BlocProvider.of(context);
  AboutUsModel? aboutUSModel;

  final Dio dio = Dio();
  Future<void> getAboutUS() async {
    emit(GetAboutUSLoading());
    await dio.get("${Constants.baseUrl}${Constants.aboutUS}").then((value) {
      // print(value.data);
      aboutUSModel = AboutUsModel.fromJson(value.data);
      // print(aboutUSModel?.data?.key);
      emit(GetAboutUSSuccess());
    }).catchError((e) {
      // print(e.toString());
      emit(GetAboutUSError());
    });
  }
}
