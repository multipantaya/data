import 'dart:convert';

class InterceptorEntityResponse {
  InterceptorEntityResponse({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  String? error;
  dynamic data;

  factory InterceptorEntityResponse.fromRawJson(String str) =>
      InterceptorEntityResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InterceptorEntityResponse.fromJson(Map<String, dynamic> json) =>
      InterceptorEntityResponse(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "error": error,
        "data": data,
      };
}
