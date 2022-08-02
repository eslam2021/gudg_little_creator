import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firist_project/SendProject/cubit5/states5.dart';
import 'package:firist_project/SendProject/model5.dart';
import 'package:firist_project/SendProject/remote5/dio_helper5.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendprojectCubit extends Cubit<SendprojectStates> {
  SendprojectCubit() : super(SendprojectInitialState()) {}

  static SendprojectCubit get(context) => BlocProvider.of(context);
  SendprojectModel? sendProjectModel;
  bool isButtonLoading=false;
  Future userSendproject({
    required String driveLink,
  }) async {


    try {
      setButtonLoading(true);
      final sendProjectData = await DioHelper3.postData(
        url: 'Comp/UploadProjectAsync${SharedPref.getUserId()}',
        data: {'driveLink': driveLink},
      );

      sendProjectModel = SendprojectModel.fromJson(sendProjectData!.data);

      if (sendProjectModel!.check) {
        emit(SendprojectSuccessState());
      } else {
        emit(SendprojectErrorState(sendProjectModel!.message));
      }
      log("---------------------------" + sendProjectModel!.check.toString());
    } catch (error, s) {
      emit(SendprojectErrorState('تم ارسال المشروع سابقا ، اذا كان هناك مشكلة برجاء لاتواصل معنا'));
      log('error on send project', error: error, stackTrace: s);
      // emit(SendprojectErrorState(error.toString()));
    }
    finally{
      setButtonLoading(false);
    }
  }

  void setButtonLoading(bool isLoading){
    isButtonLoading=isLoading;
    emit(SendprojectRefreshState());
  }

}
