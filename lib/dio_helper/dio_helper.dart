import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;

  static init() {
    https://api.weatherapi.com/v1/forecast.json?key=3da6757b678c47fda91133307222007&q=giza&days=7
    _dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query,
        String? Token}) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token
    };
    return _dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
        required Map<String, dynamic> body,
        Map<String, dynamic>? query,
        String? Token
      }) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token
    };
    return _dio!.post(url, queryParameters: query, data: body);
  }

  static Future<Response> deleteData(
      {required String url,
        Map<String, dynamic>? data,
        Map<String, dynamic>? query,
        String? Token
      }) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token
    };
    return _dio!.delete(url, queryParameters: query, data: data);
  }
}