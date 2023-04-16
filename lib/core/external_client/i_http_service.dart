import 'helpers/http_service_response.dart';

abstract class IHttpService {
  Future<HttpServiceResponse> get(String url);
}
