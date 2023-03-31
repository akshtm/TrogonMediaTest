import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:machinetest/Model/Categories.dart';
import 'package:machinetest/Model/Topcourses.dart';

class Webservice {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://futursity.com/course/api/",
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
    ),
  );

  dynamic res;

  Future<List<dynamic>> GetTopCourses() async {
    try {
      Response res = await dio.get('top_courses');
      // log(res.statusCode.toString());
      if (res.statusCode == 200) {
        // log(res.toString());
        List response = res.data;
        return response.map((e) => Topcourses.fromJson(e)).toList();
      }
    } catch (e) {
      log('TopError : $e');
    }
    return res;
  }

  Future<List<dynamic>> GetCategories() async {
    try {
      Response res = await dio.get('categories');
      log(res.statusCode.toString());
      if (res.statusCode == 200) {
        log(res.toString());
        List response = res.data;
        return response.map((e) => Categories.fromJson(e)).toList();
      }
    } catch (e) {
      log('CatError : $e');
    }
    return res;
  }
}
