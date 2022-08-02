

abstract class GudgStates {}

class GudgInitialState extends GudgStates {}
class GudgLoadingState extends GudgStates {}
class GudgRefreshState extends GudgStates {}
class GudgSuccessState extends GudgStates {}
class GudgErrorState extends GudgStates
{
  final String error;

  GudgErrorState(this.error);
}
class CompRateLoadingStates extends GudgStates{}
class CompRateSuccessStates extends GudgStates{}
class CompRateErrorStates extends GudgStates{}