import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:komida/constants/constants.dart';

Dio customDio() {
  var dioOptions = BaseOptions(
    baseUrl: endpointUrl,
  );
  Dio dio = Dio(dioOptions);

  return dio;
}

abstract class ApiService {
  static Dio dio = customDio();

  static Future<dynamic> get(
      String path, Map<String, dynamic>? parameters) async {
    try {
      var response = await dio.get(
        path,
        queryParameters: parameters,
      );
      if (response.statusCode == 200) {
        log(response.toString());
        return response;
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  static Future<dynamic> post(String path, dynamic data) async {
    try {
      var response = await dio.post(
        path,
        data: data,
      );
      log(response.toString());
      return response;
    } on DioError catch (e) {
      print(e);
    }
  }
}

class SurveyApiService extends ApiService {
  static Future<dynamic> getData() async {
    String path = '/survey/data';

    try {
      var res = await ApiService.get(path, null);
      return res.data;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<dynamic> postResponse(
    String deviceKey,
    int rice,
    int meat,
    int veg,
    int pickle,
  ) async {
    String path = '/survey/participate';

    Map<String, dynamic> data = {
      'device_key': deviceKey,
      '0': rice,
      '1': meat,
      '2': veg,
      '3': pickle,
    };

    try {
      var res = await ApiService.post(path, data);
      return res.data;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
