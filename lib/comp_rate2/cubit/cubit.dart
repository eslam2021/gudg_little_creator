import 'package:bloc/bloc.dart';
import 'package:firist_project/comp_rate2/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio_helper6.dart';


class CompRateCubit extends Cubit<CompRateStates> {
  CompRateCubit() : super(CompRateInitialStates());

  static CompRateCubit get(context) => BlocProvider.of(context);

  // List<Comp_rate_model> compRate = [];
  List<AllComprate>? compRate =[];

  void Camp_rate() {
    emit(CompRateLoadingStates());
    DioHelper6.getData(
     url: 'Judge/index',
    )?.then((value) {

      (value!.data).forEach((elament){
        compRate!.add(AllComprate.fromJson(elament));
      });
      print(compRate![0]);
      emit(CompRateSuccessStates());

    }).catchError((e) {
      print(e.toString());
      emit(CompRateErrorStates());
    });
  }
}
// هتعمل موديل وتحت الكلاس دا فيه
class AllComprate {
  AllComprate({
    required this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.bankAccount,
    required this.nationalId,
    required this.age,
    required this.compNum,
    required this.gender,
    required this.projectType,
    required this.educationalLevel,
    required this.ageType,
    required this.educationalSystem,
    required this.isAccepted,
    required this.isprojecSent,
    this.degComp,
  });
  late final int id;
  late final String fullName;
  late final String email;
  late final String address;
  late final String bankAccount;
  late final String nationalId;
  late final int age;
  late final int compNum;
  late final String gender;
  late final String projectType;
  late final String educationalLevel;
  late final String ageType;
  late final String educationalSystem;
  late final bool isAccepted;
  late final bool isprojecSent;
  late final Null degComp;

  AllComprate.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    address = json['address'];
    bankAccount = json['bankAccount'];
    nationalId = json['nationalId'];
    age = json['age'];
    compNum = json['compNum'];
    gender = json['gender'];
    projectType = json['project_type'];
    educationalLevel = json['educational_level'];
    ageType = json['ageType'];
    educationalSystem = json['educational_system'];
    isAccepted = json['isAccepted'];
    isprojecSent = json['isprojecSent'];
    degComp = json['degComp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['address'] = address;
    _data['bankAccount'] = bankAccount;
    _data['nationalId'] = nationalId;
    _data['age'] = age;
    _data['compNum'] = compNum;
    _data['gender'] = gender;
    _data['project_type'] = projectType;
    _data['educational_level'] = educationalLevel;
    _data['ageType'] = ageType;
    _data['educational_system'] = educationalSystem;
    _data['isAccepted'] = isAccepted;
    _data['isprojecSent'] = isprojecSent;
    _data['degComp'] = degComp;
    return _data;
  }
}
