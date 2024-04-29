// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

const optionsHeadersContentType = 'content-type';
const optionsExtraRefresh = 'refresh';
const headersJsonType = 'application/json';

class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  final _cache = <Uri, Response<dynamic>>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // log('onRequest: ${options.method} | ${options.path}\n');
    // log('onRequest: Data => ${options.data}\n');
    // log('onRequest: Param => ${options.queryParameters.toString()}\n');

    if (options.headers[optionsHeadersContentType] == null) {
      options.headers[optionsHeadersContentType] = headersJsonType;
    }

    final response = _cache[options.uri];
    if (options.extra[optionsExtraRefresh] == true) {
      log('${options.uri}: force refresh, ignore cache! \n');
      return handler.next(options);
    } else if (response != null) {
      log('cache hit: ${options.uri} \n');
      return handler.resolve(response);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // log('onResponse: ${response.statusCode} | ${response.statusMessage} => ${response.data}\n');
    _cache[response.requestOptions.uri] = response;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // log('onError: ${err.message}\n');
    super.onError(err, handler);
  }
}
