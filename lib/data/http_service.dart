import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpService {
  static final Dio _dio = Dio();

  static Dio get dio {
    _dio.options = BaseOptions(
      baseUrl: 'https://testseries-cf9d5dc153b9.herokuapp.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('Request: ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint('Response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (error, handler) {
        debugPrint('Error: ${error.message}');
        return handler.next(error);
      },
    ));

    return _dio;
  }
}