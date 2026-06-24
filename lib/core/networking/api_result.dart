import 'package:e_commerce/core/networking/api_error_handler.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;
  const Failure(this.errorHandler);
}
