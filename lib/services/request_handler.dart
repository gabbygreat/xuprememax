import 'package:xuprememax/utils/utils.dart';

abstract class RequestHandler {
  static Future<void> handleRequest<T>({
    required Future<T> Function() request,
    required void Function(T) onSuccess,
    required void Function(ErrorModel) onError,
    void Function()? onComplete,
  }) async {
    try {
      final response = await request.call();
      onSuccess.call(response);
    } catch (error) {
      final format = AppErrorFormatter.format(error: error);
      onError.call(format);
    } finally {
      onComplete?.call();
    }
  }
}
