class LoginResponse {
  final UserData? data;
  final LoginMeta? meta;

  const LoginResponse({this.data, this.meta});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: json['data'] is Map<String, dynamic>
          ? UserData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      meta: json['meta'] is Map<String, dynamic>
          ? LoginMeta.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data?.toJson(), 'meta': meta?.toJson()};
  }
}

class LoginMeta {
  final String? message;
  final int? code;
  final bool? error;

  const LoginMeta({this.message, this.code, this.error});

  factory LoginMeta.fromJson(Map<String, dynamic> json) {
    return LoginMeta(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      error: json['error'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'code': code, 'error': error};
  }
}

class UserData {
  final String? token;
  final User? user;

  const UserData({this.token, this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user?.toJson()};
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;

  const User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
