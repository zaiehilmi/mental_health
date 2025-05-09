import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/env.dart';
import '../../main.dart';

final apiServiceProvider = Provider((ref) => ApiService());

class ApiService {
  final Dio dio;

  ApiService({String? baseUrl}) : dio = Dio(BaseOptions(baseUrl: baseUrl ?? Env.baseUrl)) {
    _interceptors();
  }

  void _interceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          talker.log('REQUEST to ${options.path}\n${options.data}');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          talker.log('RESPONSE to ${response.realUri}\n${response.data}');

          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  // MARK: common wrappers

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return dio.post(path, data: data);
  }
}
