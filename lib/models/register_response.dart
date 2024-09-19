// models/register_response.dart

class RegisterResponse {
  final bool success;
  final String accessToken;

  RegisterResponse({required this.success, required this.accessToken});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'],
      accessToken: json['access_token'],
    );
  }
}
