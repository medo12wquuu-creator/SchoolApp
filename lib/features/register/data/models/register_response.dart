class RegisterResponse {
  final bool success;
  final String message;
  final int statusCode;

  RegisterResponse({
    required this.success,
    required this.message,
    required this.statusCode,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
    );
  }
}
