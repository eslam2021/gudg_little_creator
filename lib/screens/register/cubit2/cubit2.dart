import 'package:firist_project/screens/register/cubit2/states2.dart';
import 'package:firist_project/screens/register/remote2/dio_helper2.dart';
import 'package:firist_project/screens/register/user_model.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_model.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState()) {}

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;
  bool isButtonLoading=false;

  Future userRegister({
    required String email,
    required String password,
    required String name,
    required String confPassword,
    required String mobileNumber,
    required String nationalID,
    required String gender,
    required String age,
  }) async{
    emit(RegisterLoadingState());

    await DioHelper1.postData(
      url: 'Account/Register',
      data:
      {

        'name': name,
        'email': email,
        'password':password ,
        'confPassword': confPassword,
        'age': age,
        'mobileNumber':mobileNumber ,
        'nationalID':nationalID ,
        'gender': gender,
      },
    )!.then((value)
    {

      registerModel = RegisterModel.fromJson(value!.data);
         SharedPref().saveUserToken(registerModel!.token);
        emit(RegisterSuccessState());
      print(registerModel!.check);
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
  void setButtonLoading(bool isLoading){
    isButtonLoading=isLoading;
    emit(RegisterRefreshState());
  }
}
