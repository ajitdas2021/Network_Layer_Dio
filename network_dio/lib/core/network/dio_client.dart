import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_interceptor.dart';
import '../../dummy_token.dart';

Dio createDioClient() {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  ));

  dio.interceptors.add(ApiInterceptor(getToken: DummyTokenStorage.getToken));

  return dio;
}
