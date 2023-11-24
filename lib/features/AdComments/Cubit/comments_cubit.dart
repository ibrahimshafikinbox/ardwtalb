import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/features/AdComments/Cubit/comments_state.dart';
import 'package:ardwtalab/features/details/Model/comments_model/comments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/core/network_constants/constants.dart';

class CommentsCubit extends Cubit<CommentsState> {
  // final ProductId;
  final Dio dio = Dio();
  CommentsModel? adCommentsModel;
  CommentsModel? commentsModel;
  CommentsCubit() : super(GetAdCommentsInitial());
  static CommentsCubit get(context) => BlocProvider.of(context);

  // /ad/963/comments
  Future<void> getAdComments(adKey) async {
    emit(GetAdCommentsLoading());
    await dio.get('${Constants.baseUrl}/ad/$adKey/comments').then((value) {
      print(" data ${value.data}");
      commentsModel = CommentsModel.fromJson(value.data);
      print(commentsModel?.data!.first.customer!.avatar);
      emit(GetAdCommentsSuccess());
    }).catchError((e) {
      emit(GetAdCommentsError());
      print(e.toString());
    });
  }

  Future<void> wirteComment(adKey, {required String commentContent}) async {
    dio.options.headers['Authorization'] = Constants.token;

    FormData formData = FormData.fromMap({
      "content": commentContent,
    });
    await dio
        .post('${Constants.baseUrl}/ad/$adKey/comment', data: formData)
        .then((value) {
      print(value.data);
      showToast(text: "thanks for feedback", state: ToastStates.SUCCESS);
    }).catchError((e) {
      print(e.toString());
      showToast(
          text: "there was an error , try again ", state: ToastStates.ERROR);
    });
  }
}
