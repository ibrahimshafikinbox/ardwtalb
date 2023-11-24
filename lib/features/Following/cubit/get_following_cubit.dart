import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/features/Following/cubit/get_folllowing_state.dart';
import 'package:ardwtalab/features/Following/data/customer_details_model/customer_details_model.dart';
import 'package:ardwtalab/features/Following/data/following_ads_model/following_ads_model.dart';
import 'package:ardwtalab/features/Following/data/following_user_model/following_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/core/network_constants/constants.dart';

class FollowingCubit extends Cubit<FollowingState> {
  final Dio dio = Dio();
  FollowingCubit() : super(FollowingInitial());
  static FollowingCubit get(context) => BlocProvider.of(context);
  FollowingUserModel? followingUserModel;
  CustomerDetailsModel? customerDetailsModel;
  FollowingAdsModel? followingAdsModel;
  // get following users
  Future<void> getFollowingUsers() async {
    emit(FollowingLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio.get(
      '${Constants.baseUrl}${Constants.following}',
      queryParameters: {"type": "customer"},
    ).then((value) {
      // print(" ${value.data}");
      followingUserModel = FollowingUserModel.fromJson(value.data);
      emit(FollowingSuccess());
    }).catchError((e) {
      emit(FollowingError());
      // print(
      //   e.toString(),
      // );
    });
  }
  // get following Ads

  Future<void> getFollowingAds() async {
    dio.options.headers['Authorization'] = Constants.token;
    emit(GetFollowingAdsLoading());
    await dio.get(
      '${Constants.baseUrl}${Constants.following}',
      queryParameters: {"type": "ad"},
    ).then((value) {
      print(value.data);
      followingAdsModel = FollowingAdsModel.fromJson(value.data);
      // print(followingAdsModel?.data!.length);
      emit(GetFollowingAdsSuccess());
    }).catchError((e) {
      print(
        e.toString(),
      );
      emit(GetFollowingAdsError());
    });
  }

  // ignore: non_constant_identifier_names
  Future<void> getUserFollowingDetails(UserKey) async {
    dio.options.headers['Authorization'] = Constants.token;
    emit(GetUserFollowingDetailsLoadingstate());
    await dio
        .get(
      '${Constants.baseUrl}/customer/$UserKey/details',
    )
        .then((value) {
      emit(GetUserFollowingDetailsSuccessstate());

      // print("${value.data}");
      customerDetailsModel = CustomerDetailsModel.fromJson(value.data);
      // print(customerDetailsModel?.data?.fullName);
    }).catchError((e) {
      // print(
      //   e.toString(),
      // );
      emit(GetUserFollowingDetailsErrorstate());
    });
  }

  // follow or un follow user
  Future<void> followAndUnfollowUSer(userKey) async {
    dio.options.headers['Authorization'] = Constants.token;

    FormData formData = FormData.fromMap({
      "type": "customer",
      "id": "$userKey",
    });
    await dio
        .post(
      '${Constants.baseUrl}${Constants.followAndUnfollow}',
      data: formData,
    )
        .then((value) {
      // print("${value.data}");
      showToast(text: value.data["message"], state: ToastStates.SUCCESS);
    }).catchError((e) {
      // print(
      //   e.toString(),
      // );
    });
  }

  Future<void> follwAds(id) async {
    dio.options.headers['Authorization'] = Constants.token;

    FormData formData = FormData.fromMap({
      "type": "ad",
      "id": "$id",
    });
    await dio
        .post(
      '${Constants.baseUrl}${Constants.followAndUnfollow}',
      data: formData,
    )
        .then((value) {
      // print("${value.data}");
      showToast(text: "${value.data["message"]}", state: ToastStates.SUCCESS);
    }).catchError((e) {
      // print(
      //   e.toString(),
      // );
    });
  }

  Future<void> rateOtherCustomers(id, ratingvalue) async {
    dio.options.headers['Authorization'] = Constants.token;

    FormData formData = FormData.fromMap({
      "type": "customer",
      "rating_value": "$ratingvalue",
      "id": "$id",
    });
    await dio
        .post(
      '${Constants.baseUrl}${Constants.rateOtherCustomer}',
      data: formData,
    )
        .then((value) {
      // print("${value.data}");
      showToast(text: "thanks for Rating ", state: ToastStates.SUCCESS);
    }).catchError((e) {
      // print(e.toString());
      showToast(
          text: "there are error , try again later ", state: ToastStates.ERROR);
    });
  }
}
