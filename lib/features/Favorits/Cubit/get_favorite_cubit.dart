import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/features/Favorits/Cubit/get_favorite_states.dart';
import 'package:ardwtalab/features/Favorits/data/favorite_model/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/core/network_constants/constants.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final Dio dio = Dio();
  FavoritesCubit() : super(GetFavoritesInitial());
  static FavoritesCubit get(context) => BlocProvider.of(context);
  FavoriteModel? favoriteModel;
  Future<void> getFavorites() async {
    emit(GetFavoritesLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio
        .get(
      '${Constants.baseUrl}${Constants.customerFavorites}',
    )
        .then((value) {
      // print(" ${value.data}");
      favoriteModel = FavoriteModel.fromJson(value.data);
      // print(favoriteModel?.data?.length);

      emit(GetFavoritesSuccess());
    }).catchError((e) {
      // print(
      //   e.toString(),
      // );
      emit(GetFavoritesError());
    });
  }

  Future<void> addToFavorite(id) async {
    dio.options.headers['Authorization'] = Constants.token;

    await dio
        .post(
      '${Constants.baseUrl}/customer/favorite/$id',
    )
        .then((value) {
      // print(" ${value.data}");
      showToast(text: "Successfully", state: ToastStates.SUCCESS);
    }).catchError((e) {
      // print(
      //   e.toString(),
      // );
    });
  }
}
