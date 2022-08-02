



import 'package:bloc/bloc.dart';


import 'package:firist_project/comp_rate3/cubitt/statee2.dart';
import 'package:firist_project/shared/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio_helper7.dart';

class CompRateeCubit extends Cubit<CompRateStates1> {
  CompRateeCubit() : super(CompRateInitialStates1());

  static CompRateeCubit get(context) => BlocProvider.of(context);

 CompRateModel? CompRatee ;

  Future Camp_rate(String id) async{
    emit(CompRateLoadingStates1());
    print(SharedPref.getUserId());
    DioHelper7.getData(
     url: 'Judge/compInfo/${SharedPref.getUserId()}',
    )?.then((value) {
      CompRatee=CompRateModel.fromJson(value!.data);

      print(CompRatee!.fullName);
      emit(CompRateSuccessStates1());

    }).catchError((e) {
      print(e.toString());
      emit(CompRateErrorStates1());
    });
  }
}
// هتعمل موديل وتحت الكلاس دا فيه
class CompRateModel {
  CompRateModel({
    required this.projectIdea,
    required this.executionQuality,
    required this.gui,
    required this.contentQuality,
    required this.complexity,
    required this.projectBbenefit,
    required this.languageTools,
    required this.masteringTheTools,
    required this.infrastructureUsed,
    required this.notes,
    required this.overallRating,
    required this.email,
    required this.id,
    required this.fullName,
  });
  late final String projectIdea;
  late final String executionQuality;
  late final String gui;
  late final String contentQuality;
  late final String complexity;
  late final String projectBbenefit;
  late final String languageTools;
  late final String masteringTheTools;
  late final String infrastructureUsed;
  late final String notes;
  late final String overallRating;
  late final String email;
  late final int id;
  late final String fullName;

  CompRateModel.fromJson(Map<String, dynamic> json){
    projectIdea = json['projectIdea'];
    executionQuality = json['executionQuality'];
    gui = json['gui'];
    contentQuality = json['contentQuality'];
    complexity = json['complexity'];
    projectBbenefit = json['projectBbenefit'];
    languageTools = json['language_Tools'];
    masteringTheTools = json['masteringTheTools'];
    infrastructureUsed = json['infrastructureUsed'];
    notes = json['notes'];
    overallRating = json['overallRating'];
    email = json['email'];
    id = json['id'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['projectIdea'] = projectIdea;
    _data['executionQuality'] = executionQuality;
    _data['gui'] = gui;
    _data['contentQuality'] = contentQuality;
    _data['complexity'] = complexity;
    _data['projectBbenefit'] = projectBbenefit;
    _data['language_Tools'] = languageTools;
    _data['masteringTheTools'] = masteringTheTools;
    _data['infrastructureUsed'] = infrastructureUsed;
    _data['notes'] = notes;
    _data['overallRating'] = overallRating;
    _data['email'] = email;
    _data['id'] = id;
    _data['fullName'] = fullName;
    return _data;
  }
}
