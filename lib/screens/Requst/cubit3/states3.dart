
abstract class RequstStates {}

class RequstInitialState extends RequstStates {



}

class RequstLoadingState extends RequstStates {}
class RequstRefreshState extends RequstStates {}

class RequstSuccessState extends RequstStates
{

}

class RequstErrorState extends RequstStates
{
  final String error;

  RequstErrorState(this.error);
}