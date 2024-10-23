import 'dart:developer';

import 'package:xuprememax/utils/utils.dart';

class AppErrorFormatter {
  static ErrorModel format({required Object error}) {
    if (error is DioException) {
      if (error.response != null && error.response?.data is Map) {
        final err =
            CustomError.fromJson(error.response?.data as Map<String, dynamic>);
        return ErrorModel(
          type: DialogType.error,
          message: err.message ?? 'Something went wrong',
        );
      } else {
        log('${error.response?.statusCode}');
        if (error.type == DioExceptionType.connectionError) {
          return ErrorModel(
            type: DialogType.noInternetError,
            message: 'Check your internet connection',
          );
        } else if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.receiveTimeout) {
          return ErrorModel(
            type: DialogType.timeOut,
            message: 'Request took too long',
          );
        } else if (error.type == DioExceptionType.cancel) {
          return ErrorModel(
            type: DialogType.cancelledError,
            message: 'Request was cancelled',
          );
        } else {
          return ErrorModel(
            type: DialogType.error,
            message: 'An unexpected error occurred.',
          );
        }
      }
    }
    return ErrorModel(
      type: DialogType.error,
      message: 'Something went wrong',
    );
  }
}
