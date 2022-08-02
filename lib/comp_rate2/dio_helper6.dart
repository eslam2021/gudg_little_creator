import 'package:dio/dio.dart';

import '../../shared/shared_pref.dart';


class DioHelper6 {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://intsarelcicprize.somee.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20 *1000,
    ));
  }

  static Future<Response?>? getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      "Authorization": "Bearer ${SharedPref().getUserToken()}"
    };
    return await dio?.get(url);
  }

  static Future<Response?>? postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'authorization': "Bearer ${userToken}",
    };
    return await dio?.post(
      url,
      //queryParameters: query,
      data: data,
    );
  }
}
