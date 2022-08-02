import 'package:dio/dio.dart';
import 'package:firist_project/screens/register/remote2/dio_helper2.dart';
import 'package:firist_project/shared/network/local/cache_helper.dart';
abstract class Repository {
  Future<Response> userRegister({
    required String email,
    required String password,
    required String name,
    required String confPassword,
    required String mobileNumber,
    required String nationalID,
    required String gender,
    required String age,
  });

}

class RepoImplementation extends Repository {
  final DioHelper1 dioHelper1;
  final CacheHelper cacheHelper;

  RepoImplementation({
    required this.dioHelper1,
    required this.cacheHelper,
  });




  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
