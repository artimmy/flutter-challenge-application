import '../i_app_exception.dart';

class AppException extends IAppException {
  const AppException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
