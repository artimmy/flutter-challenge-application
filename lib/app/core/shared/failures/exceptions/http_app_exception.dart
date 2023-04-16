import 'app_exception.dart';

class HttpAppException extends AppException {
  const HttpAppException({
    required String message,
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
