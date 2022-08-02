import 'dart:developer';
import 'package:firist_project/Gudg/cubit4/states4.dart';
import 'package:firist_project/Gudg/model4.dart';
import 'package:firist_project/Gudg/remote4/dio_helper4.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
class GudgCubit extends Cubit<GudgStates> {
  GudgCubit() : super(GudgInitialState()) {}

  static GudgCubit get(context) => BlocProvider.of(context);
  GudgModel? gudgModel;
  bool isButtonLoading=false;
  Future userGudg({
    required String projectIdea,
    required String executionQuality,
    required String gui,
    required String contentQuality,
    required String complexity,
    required String projectBbenefit,
    required String language_Tools,
    required String masteringTheTools,
    required String infrastructureUsed,
    required String notes,
    required String overallRating,
  }) async {


    try {
      setButtonLoading(true);
      final gudgDataData = await DioHelper4.postData(
        url: 'Comp/UploadProjectAsync',
        data: {

          'projectIdea': projectIdea,
          'executionQuality': executionQuality,
          'gui':gui ,
          'contentQuality': contentQuality,
          'complexity':complexity ,
          'projectBbenefit': projectBbenefit,
          'language_Tools':language_Tools ,
          'masteringTheTools': masteringTheTools,
          'infrastructureUsed': infrastructureUsed,
          'notes': notes,
          'overallRating': overallRating,

        },
      );

      gudgModel = GudgModel.fromJson(gudgDataData!.data);

      if (gudgModel!.check) {
        emit(GudgSuccessState());
      } else {
        emit(GudgErrorState(gudgModel!.message));
      }
      log("---------------------------" + gudgModel!.check.toString());
    } catch (error, s) {
      emit(GudgErrorState('تم التقييم سابقا ، اذا كان هناك مشكلة برجاء لاتواصل معنا'));
      log('error on send project', error: error, stackTrace: s);
      // emit(SendprojectErrorState(error.toString()));
    }
    finally{
      setButtonLoading(false);
    }
  }

  void setButtonLoading(bool isLoading){
    isButtonLoading=isLoading;
    emit(GudgRefreshState());
  }


  Comp_rate_model? compRate ;

  Future Camp_rate(String id) async{
    emit(CompRateLoadingStates());
     DioHelper4.getData(
      url: 'Judge/compRate/$id',
    )?.then((value) {
      compRate=Comp_rate_model.fromJson(value?.data);
      print(compRate!.driveLink);
      SharedPref().saveUserId(compRate!.id.toString());
      emit(CompRateSuccessStates());
      return compRate!.driveLink;

    }).catchError((e) {
      print(e.toString());
      emit(CompRateErrorStates());
      return e.toString();
    });
  }




}
