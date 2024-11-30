class BaseResponse {
  String? message;
  bool? success;

  BaseResponse({
    this.message,
    this.success,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> parsedJson) {
    return BaseResponse(
      message: parsedJson['message'],
      success: parsedJson['success'],
    );
  }
}
