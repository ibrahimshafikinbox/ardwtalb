import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/features/details/Model/ad_details_model/ad_details_model.dart';
import 'package:ardwtalab/features/details/Model/comments_model/comments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/core/network_constants/constants.dart';

import 'package:ardwtalab/features/details/Cubit/details_state.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsCubit extends Cubit<DetailsState> {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final ProductId;
  final Dio dio = Dio();
  AdDetailsModel? adDetailsModel;
  CommentsModel? commentsModel;
  DetailsCubit(
    this.ProductId,
  ) : super(DetailsInitial());
  static DetailsCubit get(context) => BlocProvider.of(context);
  // ignore: non_constant_identifier_names
  Future<void> getDetails(ProductId) async {
    emit(DetailsLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio.get('${Constants.baseUrl}/ad/$ProductId').then((value) {
      print(" data ${value.data}");
      adDetailsModel = AdDetailsModel.fromJson(value.data);
      print("${adDetailsModel?.data?.isFavrotied}");
      emit(DetailsSuccess());
    }).catchError((e) {
      emit(DetailsError());
      print(
        e.toString(),
      );
    });
  }

// like and dis like
  Future<void> sendLike(id) async {
    dio.options.headers['Authorization'] = Constants.token;

    await dio.post('${Constants.baseUrl}/ad/$id/toggle-like', data: {
      "action_type": "like",
    }).then((value) {
      // print(" data ${value.data}");
      showToast(text: "like success", state: ToastStates.SUCCESS);
    }).catchError((e) {
      // print(e.toString());
      showToast(text: "there are proplem ", state: ToastStates.ERROR);
    });
  }

  Future<void> disLike(id) async {
    dio.options.headers['Authorization'] = Constants.token;

    await dio.post('${Constants.baseUrl}/ad/$id/toggle-like', data: {
      "action_type": "dislike",
    }).then((value) {
      // print(" data ${value.data}");
      showToast(
          text: "dis Like send successfully ", state: ToastStates.SUCCESS);
    }).catchError((e) {
      // print(e.toString());
      showToast(text: "there are proplem  ", state: ToastStates.ERROR);
    });
  }

  void openWhatsApp(String phoneNumber) async {
    String url = "https://wa.me/$phoneNumber";

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      // Handle error
      // print("Could not launch $url");
    }
  }

  void makePhoneCall(phonenumber) async {
    // ignore: deprecated_member_use
    if (await canLaunch('tel:$phonenumber')) {
      // ignore: deprecated_member_use
      await launch('tel:$phonenumber').then((value) {}).catchError((onError) {
        // print(onError.toString());
      });
    } else {
      throw 'Could not launch $phonenumber';
    }
  }
}
