import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firist_project/modules/login/remote/dio_helper.dart';
import 'package:firist_project/shared/network/local/cache_helper.dart';
import 'package:flutter/foundation.dart';
import '../../modules/login/end_points.dart';
import 'errors.dart';
abstract class Repository {
  Future<Response> userLogin({
    required String email,
    required String password,
  });

}

class RepoImplementation extends Repository {
  final DioHelper dioHelper;
  final CacheHelper cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });




  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
