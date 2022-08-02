import 'dart:convert';
import 'package:firist_project/modules/login/loginclass.dart';
import 'package:firist_project/modules/login/cubit/states.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../screens/register/user_model.dart';
import '../remote/dio_helper.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState()) {}

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  bool isButtonLoading=false;
  Future userLogin({
    required String email,
    required String password,
  })
  async{
    emit(LoginLoadingState());

    await DioHelper.postData(
      url: 'Account/Login',
      data:
      {
        'email': email,
        'password': password,
      },
    )!.then((value)
    {

      loginModel = LoginModel.fromJson(value!.data);
      SharedPref().saveUserToken(loginModel!.token);
        emit(LoginSuccessState());
      print(loginModel!.check);
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
  void setButtonLoading(bool isLoading){
    isButtonLoading=isLoading;
    emit(LoginRefreshState());
  }
}
