import 'package:dio/dio.dart';
import 'package:firist_project/SendProject/cache_helper5.dart';
import 'package:firist_project/SendProject/remote5/dio_helper5.dart';
abstract class Repository4 {
  Future<Response> userRequst({

required String driveLink,


  });

}

class RepoImplementation1 extends Repository4 {
  final DioHelper3 dioHelper3;
  final CacheHelper4 cacheHelper4;

  RepoImplementation1({
    required this.dioHelper3,
    required this.cacheHelper4,
  });




  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
