import 'package:dio/dio.dart';
import 'package:ardwtalab/features/Personal_Accont/cubit/Account_Cubit/account_states.dart';
import 'package:ardwtalab/features/Personal_Accont/data/profile_model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ardwtalab/core/network_constants/constants.dart';

class AccountCubit extends Cubit<AccountState> {
  final Dio dio = Dio();
  AccountCubit() : super(GetAccountInitial());
  static AccountCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;
  Future<void> getAccount() async {
    emit(GetAccountLoading());
    dio.options.headers['Authorization'] = Constants.token;

    await dio
        .get('${Constants.baseUrl}${Constants.customerProfile}')
        .then((value) {
      print(" ${value.data}");
      profileModel = ProfileModel.fromJson(value.data);
      emit(GetAccountSuccess());
    }).catchError((e) {
      emit(GetAccountError());
      print(e.toString());
    });
  }
}
