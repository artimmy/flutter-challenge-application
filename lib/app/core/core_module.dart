import 'package:flutter_challenge_application/app/core/shared/interfaces/modular.dart';
import 'package:flutter_challenge_application/app/core/shared/services/http_service/http_client_service.dart';
import 'package:flutter_challenge_application/app/core/shared/services/http_service/uno_http_service.dart';
import 'package:http/http.dart' as http;
import 'package:uno/uno.dart';

class CoreModule extends GlobalModule {
  @override
  final List<GlobalModule> imports = [];

  @override
  final List<GlobalBind<Object>> binds = [
    // Http Service
    GlobalBind.factory((i) => http.Client()),
    GlobalBind.factory((i) => HttpClientService(client: i())),

    // Uno Service
    GlobalBind.factory((i) => Uno()),
    GlobalBind.factory((i) => UnoHttpService(uno: i())),
  ];
}
