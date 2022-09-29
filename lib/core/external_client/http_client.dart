import 'package:http/http.dart' as _http;

abstract class HttpClient {
  Future<HttpResponse> get(String url);
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;
  const HttpResponse({
    required this.data,
    this.statusCode,
  });
}

class HttpClientImpl implements HttpClient {
  final _http.Client client;
  HttpClientImpl({
    required this.client,
  });

  @override
  Future<HttpResponse> get(String url) async {
    try {
      final response = await _http.get(Uri.parse(url));
      return HttpResponse(data: response.body, statusCode: response.statusCode);
    } catch (e) {
      return HttpResponse(data: 'error ===> $e', statusCode: 500);
    }
  }
}
