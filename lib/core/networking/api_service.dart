import 'package:dio/dio.dart';
import 'package:e_commerce/core/networking/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<T> get<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      '${ApiConstants.apiBaseUrl}$endpoint',
      queryParameters: queryParameters,
    );
    return fromJson(response.data);
  }

  Future<T> post<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      '${ApiConstants.apiBaseUrl}$endpoint',
      data: data,
      queryParameters: queryParameters,
    );
    return fromJson(response.data);
  }

  Future<T> put<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.put(
      '${ApiConstants.apiBaseUrl}$endpoint',
      data: data,
      queryParameters: queryParameters,
    );
    return fromJson(response.data);
  }

  Future<void> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    await _dio.delete(
      '${ApiConstants.apiBaseUrl}$endpoint',
      data: data,
      queryParameters: queryParameters,
    );
  }
}
