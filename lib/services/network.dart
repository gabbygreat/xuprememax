import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:xuprememax/utils/utils.dart';

abstract class NetworkService {
  NetworkService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (kDebugMode) {
            log('${options.uri}');
            log('${options.data}');
          }
          final elevenLabAPIKey = AppConstant.elevenLabsAPIKey;
          options.headers.addAll({'xi-api-key': elevenLabAPIKey});
          options.headers.addAll({'Accept': 'application/json'});
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            log(response.data.toString());
          }
          return handler.next(response);
        },
        onError: (e, handler) async {
          return handler.next(e);
        },
      ),
    );
  }
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
    ),
  );

  Future<Response<T>> getRequestHandler<T>(
    String path, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    var uri = '${AppConstant.baseUrl}$path';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.get<T>(
      uri,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );

    return a;
  }

  Future<Response<T>> postRequestHandler<T>(
    String path, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    var uri = '${AppConstant.baseUrl}$path';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.post<T>(
      uri,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );
    return a;
  }

  Future<Response<T>> patchRequestHandler<T>(
    String path, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    var uri = '${AppConstant.baseUrl}$path';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.patch<T>(
      uri,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );
    return a;
  }

  Future<Response<T>> deleteRequestHandler<T>(
    String path, {
    Options? options,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    var uri = '${AppConstant.baseUrl}$path';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.delete<T>(
      uri,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );
    return a;
  }

  Future<Response<T>> putRequestHandler<T>(
    String path, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    var uri = '${AppConstant.baseUrl}$path';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.put<T>(
      uri,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );
    return a;
  }

  Future<Response> downloadRequestHandler(
    String path,
    String savePath, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryPatameters,
    bool useBaseUrl = true,
    CancelToken? cancelToken,
  }) async {
    var uri = '${AppConstant.baseUrl}$path';
    if (!useBaseUrl) {
      uri = path;
    }
    final a = await _dio.download(
      uri,
      savePath,
      options: options,
      queryParameters: queryPatameters,
      data: data,
      cancelToken: cancelToken,
    );
    return a;
  }
}
