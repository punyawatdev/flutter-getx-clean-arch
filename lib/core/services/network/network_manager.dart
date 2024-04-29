// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/core/services/network/constants/request_method.dart';
import 'package:flutter_getx_clean_arch/core/services/network/dio_cache_manager.dart';

class NetworkManager {
  final Dio dio;

  const NetworkManager._(this.dio);

  factory NetworkManager() {
    final dio = Dio();

    dio.interceptors
      ..add(CacheInterceptor())
      ..add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (o) => log(o.toString()),
      ));

    return NetworkManager._(dio);
  }

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.value,
        headers: headers,
      ),
    );
  }
}
