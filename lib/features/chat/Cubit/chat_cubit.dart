import 'package:dio/dio.dart';
import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/features/chat/Cubit/chat_states.dart';
import 'package:ardwtalab/features/chat/Model/chat_rooms_model/chat_rooms_model.dart';
import 'package:ardwtalab/features/chat/Model/list_chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  final Dio dio = Dio();
  ListChatModel? chatlistModel;
  ChatRoomsModel? chatRoomsModel;

  ChatCubit() : super(ChatInitialState());
  static ChatCubit get(context) => BlocProvider.of(context);
// get chat lists
  Future<void> getlistUsers() async {
    emit(ChatLoadingState());
    dio.options.headers['Authorization'] = Constants.token;

    await dio.get("${Constants.baseUrl}${Constants.chatList}").then((value) {
      // print(value.data);
      chatlistModel = ListChatModel.fromJson(value.data);
      // print(chatlistModel?.items?.first.lastMessage?.content);
      emit(ChatSuccessState());
    }).catchError((e) {
      // print(e.toString());
      emit(ChatErrorState());
    });
  }

  // get chat rooms
  Future<void> getChatRomms(String userId) async {
    emit(GetChatRoomsLoadingState());
    dio.options.headers['Authorization'] = Constants.token;

    await dio.get("${Constants.baseUrl}/chat/$userId").then((value) {
      // print(value.data);
      chatRoomsModel = ChatRoomsModel.fromJson(value.data);
      // print(chatRoomsModel.customer.firstName);
      emit(GetChatRoomsSuccessState());
    }).catchError((e) {
      // print(e.toString());
      emit(GetChatRoomsErrorState());
    });
  }

  // {{at-server}}
  Future<void> sendMessageInChatRoom(
      {required id, required String content}) async {
    dio.options.headers['Authorization'] = Constants.token;

    await dio.post("${Constants.baseUrl}${Constants.sendChat}", data: {
      "customer2_id": id,
      "content": content,
    }).then((value) {
      showToast(text: "message send ", state: ToastStates.SUCCESS);
      // print(value.data);
    }).catchError((e) {
      // print(e.toString());
    });
  }
}
