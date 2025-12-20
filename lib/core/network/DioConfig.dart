import 'package:final_proj/core/network/ApiConstants.dart';
import 'package:dio/dio.dart';

class DioConfig {
  DioConfig._();

  static Duration timeOut = Duration(seconds: 30);

  static Dio getDio()
  {
    Dio dio = Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..options.contentType = Headers.jsonContentType
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}