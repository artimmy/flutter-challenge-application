import 'package:flutter_challenge_application/app/core/shared/interfaces/modular.dart';
import 'package:flutter_challenge_application/app/core/shared/services/external_client/http_client.dart';
import 'package:http/http.dart' as _http;

class CoreModule extends GlobalModule {
  @override
  final List<GlobalModule> imports = [];

  @override
  final List<GlobalBind<Object>> binds = [
    // HttpService
    GlobalBind.factory((i) => _http.Client()),
    GlobalBind.factory((i) => HttpService(client: i())),
  ];
}
