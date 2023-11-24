import 'package:ardwtalab/core/helper/show_toast_helper.dart';
import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:ardwtalab/features/contact_with_us/cubit/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactWithUsCubit extends Cubit<ContactWithUsState> {
  final Dio _dio = Dio();

  ContactWithUsCubit() : super(ContactWithUsInitial());
  static ContactWithUsCubit get(context) => BlocProvider.of(context);

  Future<void> contactWithUs({
    required String email,
    required String name,
    required String phone,
    required String message,
  }) async {
    emit(ContactWithUsLoading());
    await _dio.post(
      '${Constants.baseUrl}${Constants.contactus}',
      data: {
        'sender_mobile': phone,
        'sender_name': name,
        'sender_email': email,
        'message': message,
        "sender_country_code": "eg",
      },
      // data: {
      //   'sender_mobile': "01002605839",
      //   'sender_name': "my name",
      //   'sender_email': "adham@gmail.com",
      //   'message': "this is my messageddd, please reply urgently",
      //   "sender_country_code": "eg",
      // },
    ).then((value) {
      // print(value.data);
      showToast(text: value.data["message"], state: ToastStates.SUCCESS);
      emit(ContactWithUsSuccess());
    }).catchError((onError) {
      // print(onError);
    });
    showToast(text: "there are proplem ", state: ToastStates.ERROR);
  }
}
