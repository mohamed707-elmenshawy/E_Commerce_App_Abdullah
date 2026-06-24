class LoginRequestBody {
  final String email;
  final String password;

  const LoginRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email_or_phone': email,
      'password': password,
    };
  }
}
