import 'package:flutter_challenge_application/app/core/shared/failures/exceptions/http_app_exception.dart';
import 'package:http/http.dart' as _http;

import 'helpers/http_service_response.dart';
import 'i_http_service.dart';

class HttpService implements IHttpService {
  final _http.Client client;
  HttpService({
    required this.client,
  });

  @override
  Future<HttpServiceResponse> get(String url) async {
    try {
      final response = await _http.get(Uri.parse(url));
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
      client.close();
    }
  }
}
