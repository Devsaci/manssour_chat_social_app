
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manssour_chat_social_app/modules/social_login/cubit/states.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  // SocialLoginCubit(SocialLoginStates initialState) : super(initialState);
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);
  SocialLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        print(value.data);
        loginModel = SocialLoginModel.fromJson(value.data);
        emit(SocialLoginSuccessState(loginModel!));
        // print('////////loginModel?.data.token////////');
        // print(loginModel?.data.token);
        // print('////////loginModel?.status////////');
        // print(loginModel?.status);
        // print('////////loginModel?.message////////');
        // print(loginModel?.message);
        // print(value.data['message']);
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityState());
  }
}
