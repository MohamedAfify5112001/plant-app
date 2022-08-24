import 'dart:io';

import 'package:dio/dio.dart';

import '../../presentation/shared/constants/constants.dart';

class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: AppConstants.BASEURL,
      ),
    );
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
  }

  static Future<Response> postData(
      {required String path,
      required Map<String, dynamic> data,
      String? token}) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      HttpHeaders.contentTypeHeader: "application/json",
    };
    return await dio.post(path, data: data);
  }

  static Future<Response> getData({required String path, String? token}) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    return await dio.get(path);
  }
}
