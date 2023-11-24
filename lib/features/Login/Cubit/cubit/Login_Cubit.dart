// // ignore_for_file: file_names

// import 'package:ardwtalab/core/network_constants/constants.dart';
// import 'package:ardwtalab/core/network_constants/local_constants.dart';
// import 'package:ardwtalab/features/Login/Cubit/cubit/Login_States.dart';
// import 'package:dio/dio.dart';
// import 'package:ardwtalab/features/Login/data/login_model/login_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginCubit extends Cubit<LoginStates> {
//   final Dio dio = Dio();
//   LoginModel? loginModel;

//   LoginCubit() : super(LoginInitial());
//   static LoginCubit get(context) => BlocProvider.of(context);

//   Future<void> loginUser({
//     required mobile,
//     required pass,
//   }) async {
//     emit(LoginLoading());
//     try {
//       final response = await Dio().post(
//         // "${Constants.baseUrl}${Constants.login}",
//         "https://sender.fudex-tech.net/ard-w-talab/public/api/customer-auth/login",
//         data: {
//           "country_code": "sa",
//           "mobile": mobile,
//           "password": pass,
//           "device_token": "kkdkkdddk ",
//           "type": "android"
//         },
//       );

//       print(response.data);
//       final loginModel = LoginModel.fromJson(response.data);
//       print(loginModel.token);
//       // await saveUserToken("${loginModel.token}");
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('token', loginModel.token.toString()).then((value) {
//         accessToken = loginModel.token.toString();
//       });
//       print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$accessToken");
//       emit(LoginSuccess());
//     } catch (e) {
//       print(e.toString());
//       emit(LoginError());
//     }
//   }

//   Future<void> saveUserToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//   }

//   // Function to retrieve user token from shared preferences
//   Future<String?> getUserToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }
// }
// ignore_for_file: file_names

import 'package:ardwtalab/core/network_constants/constants.dart';
import 'package:ardwtalab/core/network_constants/local_constants.dart';
import 'package:ardwtalab/features/Login/Cubit/cubit/Login_States.dart';
import 'package:dio/dio.dart';
import 'package:ardwtalab/features/Login/data/login_model/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  final Dio dio = Dio();
  LoginModel? loginModel;

  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> loginUser({
    required mobile,
    required pass,
  }) async {
    emit(LoginLoading());
    try {
      final response = await Dio().post(
        // "${Constants.baseUrl}${Constants.login}",
        "https://sender.fudex-tech.net/ard-w-talab/public/api/customer-auth/login",
        data: {
          "country_code": "sa",
          "mobile": mobile,
          "password": pass,
          "device_token": "kkdkkdddk ",
          "type": "android"
        },
      );

      print(response.data);
      final loginModel = LoginModel.fromJson(response.data);
      await saveUserToken("${loginModel.token}").then((value) async {
        String? savedToken = await getUserToken();
        accessToken = await getUserToken();

        print(savedToken);
      });

      emit(LoginSuccess());
    } catch (e) {
      print(e.toString());
      emit(LoginError());
    }
  }

  Future<void> logout() async {
    // Clear the token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('newToken');

    // Emit a state indicating logout
  }

  Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('newToken', token);
  }

  // Function to retrieve user token from shared preferences
  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('newToken');
  }
}

String? newToken;
