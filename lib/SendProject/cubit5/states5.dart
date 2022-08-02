

abstract class SendprojectStates {}

class SendprojectInitialState extends SendprojectStates {}

class SendprojectLoadingState extends SendprojectStates {}
class SendprojectRefreshState extends SendprojectStates {}

class SendprojectSuccessState extends SendprojectStates {}

class SendprojectErrorState extends SendprojectStates
{
  final String error;

  SendprojectErrorState(this.error);
}