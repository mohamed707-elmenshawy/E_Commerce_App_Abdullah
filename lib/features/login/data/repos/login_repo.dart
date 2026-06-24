import 'package:e_commerce/core/networking/api_constants.dart';
import 'package:e_commerce/core/networking/api_error_handler.dart';
import 'package:e_commerce/core/networking/api_result.dart';
import 'package:e_commerce/core/networking/api_service.dart';
import 'package:e_commerce/features/login/data/models/login_request_body.dart';
import 'package:e_commerce/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.post<LoginResponse>(
        endpoint: ApiConstants.login,
        data: loginRequestBody.toJson(),
        fromJson: LoginResponse.fromJson,
      );
      return Success(response);
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }
}
