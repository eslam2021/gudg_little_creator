



import 'package:bloc/bloc.dart';


import 'package:firist_project/comp_rate3/cubitt/statee2.dart';
import 'package:firist_project/modules/profile/profileApi/cubitProfile/stateProfile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio_helper7.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialStates());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileModel? Profile ;

  Future getProfile() async{
    emit(ProfileLoadingStates());
    DioHelper5.getData(
     url: 'Judge/Profile',
    )?.then((value) {
      print(value);
      Profile=ProfileModel.fromJson(value!.data);

      emit(ProfileSuccessStates());

    }).catchError((e) {
      print(e.toString());
      emit(ProfileErrorStates());
    });
  }
}
// هتعمل موديل وتحت الكلاس دا فيه
class ProfileModel {
  ProfileModel({
    required this.name,
    required this.email,
    required this.age,
    required this.mobileNumber,
    required this.nationalID,
    required this.gender,
    required this.projectType,
    this.educationalLevel,
    this.ageType,
    this.educationalSystem,
  });
  late final String name;
  late final String email;
  late final int age;
  late final String mobileNumber;
  late final String nationalID;
  late final String gender;
  late final String projectType;
  late final Null educationalLevel;
  late final Null ageType;
  late final Null educationalSystem;

  ProfileModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    age = json['age'];
    mobileNumber = json['mobileNumber'];
    nationalID = json['nationalID'];
    gender = json['gender'];
    projectType = json['project_type'];
    educationalLevel = json['educational_level'];
    ageType = json['ageType'];
    educationalSystem = json['educational_system'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['age'] = age;
    _data['mobileNumber'] = mobileNumber;
    _data['nationalID'] = nationalID;
    _data['gender'] = gender;
    _data['project_type'] = projectType;
    _data['educational_level'] = educationalLevel;
    _data['ageType'] = ageType;
    _data['educational_system'] = educationalSystem;
    return _data;
  }
}
