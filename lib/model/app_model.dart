import 'package:xuprememax/model/enum.dart';

class ErrorModel {
  ErrorModel({
    required this.type,
    required this.message,
  });
  String message;
  DialogType type;
}

class CustomError {
  CustomError({
    required this.message,
  });

  factory CustomError.fromJson(Map<String, dynamic> data) {
    return CustomError(
      message: data['message'] as String?,
    );
  }
  final String? message;
}
