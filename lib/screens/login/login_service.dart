// lib/services/auth_service.dart

import 'package:dio/dio.dart';

import '../../models/models.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      followRedirects: false,
      validateStatus: (status) => true, // Allow all status codes
    ),
  );

  final String _loginUrl = 'https://graphapi.ttbadminton.vn/auth/v1/login';

  Future<bool> login(
      {required String username, required String password}) async {
    try {
      print("object,$_loginUrl");
      final response = await _dio.post(
        _loginUrl,
        data: {
          'username': username,
          'password': password,
        },
      );
      print(response);
      if (response.data['data'] != null) {
        print(response.data['data']['name']);
        final user = User.fromJson(response.data['data']);
        print(user.name);
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print('Dio error: ${e}');
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
