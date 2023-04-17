import 'package:flutter_challenge_application/app/core/shared/failures/i_app_exception.dart';

class AppError extends IAppException {
  const AppError({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
