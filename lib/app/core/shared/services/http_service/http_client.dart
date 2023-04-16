import 'package:flutter_challenge_application/app/core/shared/failures/exceptions/http_app_exception.dart';
import 'package:uno/uno.dart';

import 'helpers/http_service_response.dart';
import 'i_http_service.dart';

class HttpService implements IHttpService {
  final Uno uno;
  HttpService({
    required this.uno,
  });

  @override
  Future<HttpServiceResponse> get(String url) async {
    try {
      final response = await uno.get(Uri.parse(url));
      return HttpServiceResponse(
        data: response.body,
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw HttpAppException(
        message: e.toString(),
        stackTrace: StackTrace.current,
      );
    } finally {
      uno.close();
    }
  }
}
