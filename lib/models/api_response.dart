
class ApiResponse {
  final bool success;
  final int statusCode;
  final String? errorMessage;
  final dynamic responseData;

  ///The class responsible of handling back-end API responses
  ///
  /// ***
  ///
  /// THIS CLASS HAS TO BE CHANGED ACCORDING TO THE BACK-END RESPONSES
  ///
  /// ***
  ApiResponse({
    required this.statusCode,
    required this.success,
    this.errorMessage,
    this.responseData,
  });
}
