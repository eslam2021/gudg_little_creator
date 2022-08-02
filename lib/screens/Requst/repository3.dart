import 'package:dio/dio.dart';
import 'package:firist_project/screens/Requst/cache_helper3.dart';
import 'package:firist_project/screens/Requst/remote3/dio_helper3.dart';
abstract class Repository3 {
  Future<Response> userRequst({
    required String fullName,
    required String email,
    required String address,
    required String bankAccount,
    required String nationalId,
    required String age,
    required String compNum,
    required String gender,
    required String project_type,
    required String educational_level,
    required String ageType,
    required String educational_system,



  });

}

class RepoImplementation extends Repository3 {
  final DioHelper2 dioHelper2;
  final CacheHelper3 cacheHelper3;

  RepoImplementation({
    required this.dioHelper2,
    required this.cacheHelper3,
  });




  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
