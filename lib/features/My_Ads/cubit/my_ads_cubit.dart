import 'package:dio/dio.dart';
import 'package:ardwtalab/features/My_Ads/cubit/my_ads_state.dart';
import 'package:ardwtalab/features/My_Ads/data/my_ads_model/my_ads_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network_constants/constants.dart';

class MyAdsCubit extends Cubit<MyadsStates> {
  MyAdsCubit() : super(GetMyAdsInitial());
  final Dio dio = Dio();
  MyAdsModel? myAdsModel;
  static MyAdsCubit get(context) => BlocProvider.of(context);
  Future<void> getMyAds() async {
    emit(GetMyAdsLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio.get('${Constants.baseUrl}${Constants.myAds}').then((value) {
      emit(GetMyAdsSuccess());
      print("${value.data}🚀🚀🚀🚀");

      myAdsModel = MyAdsModel.fromJson(value.data);
    }).catchError((e) {
      emit(GetMyAdsError());
      print(e.toString());
    });
  }
}
