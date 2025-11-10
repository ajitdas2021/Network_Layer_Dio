import 'package:dio/dio.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_constants.dart';
import '../../core/network/api_response.dart';
import '../../core/network/dio_client.dart';

class PostRepository {
  late final ApiClient apiClient;

  PostRepository() {
    // Create ApiClient using Dio with interceptor
    apiClient = ApiClient(createDioClient());
  }

  /// Fetch posts (dummy API, no token)
  Future<ApiResponse> getPosts() async {
    try {
      final Response response = await apiClient.get(
        ApiConstants.posts,
        authorization: false,
      );
      return ApiResponse.success(response.data);
    } catch (e) {
      return ApiResponse.failure(e.toString());
    }
  }

  /// Create post (dummy API, with token)
  Future<ApiResponse> createPost(Map<String, dynamic> data) async {
    try {
      final Response response = await apiClient.post(
        ApiConstants.posts,
        data: data,
        authorization: true, // token attached
      );
      return ApiResponse.success(response.data);
    } catch (e) {
      return ApiResponse.failure(e.toString());
    }
  }
}
