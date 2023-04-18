import 'package:flutter_challenge_application/app/core/shared/services/http_service/helpers/http_service_response.dart';
import 'package:uno/uno.dart';

import '../../failures/exceptions/http_app_exception.dart';
import 'i_http_service.dart';

class UnoHttpService implements IHttpService {
  final Uno uno;

  const UnoHttpService({
    required this.uno,
  });

  @override
  Future<HttpServiceResponse> get(String url) async {
    try {
      final response = await uno.get(url);

      return HttpServiceResponse(
        data: response.data,
        statusCode: response.status,
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
    }
  }
}
