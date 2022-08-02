import 'dart:developer';
import 'package:firist_project/SendProject/remote5/dio_helper5.dart';
import 'package:firist_project/screens/Requst/cubit3/states3.dart';
import 'package:firist_project/screens/Requst/remote3/dio_helper3.dart';
import 'package:firist_project/screens/Requst/user_model3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequstCubit extends Cubit<RequstStates> {
  RequstCubit() : super(RequstInitialState()) {}

  static RequstCubit get(context) => BlocProvider.of(context);
  RequstModel? requstModel;
  bool isButtonLoading = false;

  Future userRequst({
    required String fullName,
    required String email,
    required String address,
    required String bankAccount,
    required String nationalId,
    required String age,
    required String compNum,
    required String gender,
    required String project_type,
    required String educational_level,
    required String ageType,
    required String educational_system,
  }) async {
    try {
      setButtonLoading(true);
      final requstData = await DioHelper2.postData(
        url: 'User/CompRegs',
        data: {
          'fullName': fullName,
          'email': email,
          'address': address,
          'bankAccount': bankAccount,
          'nationalId': nationalId,
          'age': age,
          'compNum': compNum,
          'gender': gender,
          'project_type': project_type,
          'educational_level': educational_level,
          'ageType': ageType,
          'educational_system': educational_system,
        },
      );

      requstModel = RequstModel.fromJson(requstData!.data);

      if (requstModel!.check) {
        emit(RequstSuccessState());
      } else {
        emit(RequstErrorState(requstModel!.message));
      }
      log("---------------------------" + requstModel!.check.toString());
    } catch (error, s) {
      emit(RequstErrorState(
          'تم التسجيل سابقا ، اذا كان هناك مشكلة برجاء لاتواصل معنا'));
      log('error on send project', error: error, stackTrace: s);
    } finally {
      setButtonLoading(false);
    }
  }

  void setButtonLoading(bool isLoading) {
    isButtonLoading = isLoading;
    emit(RequstRefreshState());
  }
}
