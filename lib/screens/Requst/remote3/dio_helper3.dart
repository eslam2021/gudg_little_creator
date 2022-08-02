import 'package:dio/dio.dart';
import 'package:firist_project/shared/shared_pref.dart';

class DioHelper2 {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://intsarelcicprize.somee.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?>? getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': token ?? '',
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?>? postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': "Bearer ${SharedPref().getUserToken()}" ,
    };
    return await dio?.post(
      url,
      //queryParameters: query,
      data: data,
    );
  }
}
