import 'package:flutter_challenge_application/app/core/shared/interfaces/modular.dart';
import 'package:flutter_challenge_application/app/core/shared/services/http_service/http_client_service.dart';
import 'package:http/http.dart' as http;

class CoreModule extends GlobalModule {
  @override
  final List<GlobalModule> imports = [];

  @override
  final List<GlobalBind<Object>> binds = [
    // HttpService
    GlobalBind.factory((i) => http.Client()),
    GlobalBind.factory((i) => HttpClientService(client: i())),
  ];
}
