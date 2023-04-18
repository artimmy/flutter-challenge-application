import 'dart:convert';

import 'package:flutter_challenge_application/app/core/shared/failures/exceptions/http_app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'helpers/http_service_response.dart';
import 'i_http_service.dart';

class HttpClientService implements IHttpService {
  final http.Client client;

  const HttpClientService({
    required this.client,
  });

  @override
  Future<HttpServiceResponse> get(String url) async {
    try {
      final response = await client.get(Uri.parse(url));
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      return HttpServiceResponse(
        data: jsonResponse,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpAppException(
        message: e.message,
        stackTrace: StackTrace.current,
      );
    } finally {
      client.close();
    }
  }
}
