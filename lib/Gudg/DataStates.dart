abstract class LinkStates {}

class LinkInitialState extends LinkStates {}

class LinkLoadingState extends LinkStates {}

class LinkChangeFavLoadingState extends LinkStates {}

class LinkChangeFavSuccessState extends LinkStates {}

class LinkChangeFavErrorState extends LinkStates
{
  final String error;

  LinkChangeFavErrorState(this.error);
}
