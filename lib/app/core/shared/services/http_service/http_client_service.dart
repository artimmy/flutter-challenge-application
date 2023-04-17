import 'dart:convert';

import 'package:flutter_challenge_application/app/core/shared/failures/exceptions/http_app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

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
    } on UnoError catch (e) {
      final code = e.response!.status;
      switch (code) {
        case 400:
          throw HttpAppException(
            message: 'Requisição errada: $code',
            stackTrace: StackTrace.current,
          );
        case 404:
          throw HttpAppException(
            message: 'Ops! Nós não achamos nada, tente outra coisa: $code',
            stackTrace: StackTrace.current,
          );
        case 408:
          throw HttpAppException(
            message: 'A requisição demorou demais, tente novamente: $code',
            stackTrace: StackTrace.current,
          );
        case 500:
          throw HttpAppException(
            message: 'Erro interno no serivdor, tente mais tarde: $code',
            stackTrace: StackTrace.current,
          );
        case 503:
          throw HttpAppException(
            message: 'O serviço esta indisponível no momento, tente mais tarde: $code',
            stackTrace: StackTrace.current,
          );
        case 511:
          throw HttpAppException(
            message: 'Você precisa se autenticar, faça o login $code',
            stackTrace: StackTrace.current,
          );
        default:
          throw HttpAppException(
            message: 'Erro inesperado: ${e.message} $code',
            stackTrace: StackTrace.current,
          );
      }
    } finally {
      client.close();
    }
  }
}
