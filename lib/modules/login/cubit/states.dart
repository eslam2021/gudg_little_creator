
import 'package:firist_project/modules/login/loginclass.dart';

import '../../../screens/register/user_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginRefreshState extends LoginStates {}
class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}