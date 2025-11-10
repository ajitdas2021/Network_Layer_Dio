import 'package:dio/dio.dart';
import 'api_constants.dart';

class ApiInterceptor extends Interceptor {
  final Future<String?> Function() getToken;

  ApiInterceptor({required this.getToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final bool requiresAuth = options.extra['authorization'] == true;
      if (requiresAuth) {
        final token = await getToken();
        if (token != null && token.isNotEmpty) {
          options.headers[ApiConstants.headerAuthorization] = 'Bearer $token';
        }
      }
    } catch (_) {}
    return handler.next(options);
  }
//   @override
// void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//   try {
//     final bool requiresAuth = options.extra['authorization'] == true;
//     print('🛰️ Interceptor triggered for: ${options.path}');
//     print('Authorization required: $requiresAuth');

//     if (requiresAuth) {
//       final token = await getToken();
//       print('Attaching token: $token');

//       if (token != null && token.isNotEmpty) {
//         options.headers[ApiConstants.headerAuthorization] = 'Bearer $token';
//       }
//     } else {
//       print('No authorization needed for this request');
//     }
//   } catch (e) {
//     print('❌ Interceptor error: $e');
//   }
//   return handler.next(options);
// }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
