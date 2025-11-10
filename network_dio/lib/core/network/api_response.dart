class ApiResponse<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;

  ApiResponse._({this.data, this.errorMessage, required this.isSuccess});

  /// Factory method for success
  factory ApiResponse.success(T data) {
    return ApiResponse._(data: data, isSuccess: true);
  }

  /// Factory method for failure
  factory ApiResponse.failure(String errorMessage) {
    return ApiResponse._(errorMessage: errorMessage, isSuccess: false);
  }
}
