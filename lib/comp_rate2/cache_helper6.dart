import 'dart:convert' hide utf8;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper7
{
  Future get(String key);

  Future<bool> has(String key);

  Future<bool> put(String key, dynamic value);

  Future<bool> clear(String key);
}



