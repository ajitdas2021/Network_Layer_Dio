import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  ApiClient(this._dio);

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, bool authorization = false, Options? options}) {
    final opts = options?.copyWith(extra: {...?options.extra, 'authorization': authorization}) ??
        Options(extra: {'authorization': authorization});
    return _dio.get(path, queryParameters: queryParameters, options: opts);
  }

  Future<Response> post(String path,
      {dynamic data, bool authorization = false, Options? options}) {
    final opts = options?.copyWith(extra: {...?options.extra, 'authorization': authorization}) ??
        Options(extra: {'authorization': authorization});
    return _dio.post(path, data: data, options: opts);
  }
}
