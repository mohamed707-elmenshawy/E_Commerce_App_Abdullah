class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'];
    if (meta is Map<String, dynamic>) {
      return ApiErrorModel(
        message: meta['message'] as String?,
        code: (meta['code'] as num?)?.toInt(),
      );
    }

    return ApiErrorModel(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'code': code,
      };
}
