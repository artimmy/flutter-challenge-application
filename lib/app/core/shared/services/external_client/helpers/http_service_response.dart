class HttpServiceResponse {
  final dynamic data;
  final int? statusCode;
  const HttpServiceResponse({
    required this.data,
    this.statusCode,
  });
}
