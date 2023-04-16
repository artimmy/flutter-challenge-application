import 'package:http/http.dart' as _http;

import 'helpers/http_service_response.dart';
import 'i_http_service.dart';

class HttpClientImpl implements IHttpService {
  final _http.Client client;
  HttpClientImpl({
    required this.client,
  });

  @override
  Future<HttpServiceResponse> get(String url) async {
    try {
      final response = await _http.get(Uri.parse(url));
      return HttpServiceResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return HttpServiceResponse(data: 'error ===> $e', statusCode: 500);
    }
  }
}
