import 'package:dio/dio.dart';
import 'package:firist_project/Gudg/remote4/dio_helper4.dart';
import 'package:firist_project/screens/Requst/cache_helper3.dart';
abstract class Repository5{
  Future<Response> userGudg({
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




  });

}



class RepoImplementation extends Repository5 {
  final DioHelper4 dioHelper4;
  final CacheHelper3 cacheHelper3;

  RepoImplementation({
    required this.dioHelper4,
    required this.cacheHelper3,
  });
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
