import 'package:dio/dio.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/terms_and_Conditions/cubit/terms_state.dart';
import 'package:ardwtalab/features/terms_and_Conditions/data/terms_and_conditons_model/terms_and_conditons_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(GetTermsInitial());
  static TermsCubit get(context) => BlocProvider.of(context);
  // ignore: non_constant_identifier_names
  TermsAndConditonsModel? TermsModel;

  final Dio dio = Dio();
  Future<void> getTerms() async {
    emit(GetTermsLoading());
    await dio
        .get("${Constants.baseUrl}${Constants.termsAndConditions}")
        .then((value) {
      // print(value.data);
      TermsModel = TermsAndConditonsModel.fromJson(value.data);
      emit(GetTermsSuccess());
    }).catchError((e) {
      emit(GetTermsError());
    });
  }
}
