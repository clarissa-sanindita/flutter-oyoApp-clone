import 'package:dio/dio.dart';

import '../../model_auth.dart';
import '../network/api/auth/auth.dart';
import '../network/dio_exception.dart';


class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<ModelAuth> loginReq(String username, String password) async {
    try {
      final response = await authApi.loginApi(username, password);
      if (response.statusCode == 200) {
        return ModelAuth.fromJson(response.data);
      } else {
        return ModelAuth.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<String> registerReq(String username, String password, String name) async {
    try {
      final response = await authApi.registerApi(username, password, name);
      if (response.statusCode == 200) {
        return "OK";
      } else {
        return "Something bad happen";
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<String> meReq(String token) async {
    try {
      final response = await authApi.meApi(token);
      return response.data["name"];
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
