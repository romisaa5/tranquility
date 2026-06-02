import 'package:dio/dio.dart';
import 'package:tranquility/core/constants/api_constants.dart';

class ApiClient {
  final Dio dio;
  ApiClient(this.dio);
  Future<Response> login(Map<String, dynamic> body) {
    return dio.post(ApiConstants.login, data: body);
  }
}
