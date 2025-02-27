// lib/services/auth_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../models/models.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://105a7394-9e19-4b48-9270-6fa500fe4b4a.mock.pstmn.io/',
      followRedirects: false,
      validateStatus: (status) => true, // Allow all status codes
    ),
  );

  final String _loginUrl = 'auth/v1/login2';
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

      if (response.statusCode == 200 && response.data['data'] != null) {
        final accessToken = response.data['data']['accessToken'];
        print("Đăng nhập thành công! Token: $accessToken");

        // Lưu token vào SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('username', username);
        await prefs.setString('accessToken', accessToken);

        return true;
      } else {
        print("Đăng nhập thất bại: ${response.data}");
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

  // Hàm đăng xuất
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Hàm kiểm tra xem người dùng đã đăng nhập hay chưa
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Hàm lấy token từ SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  // Hàm lấy thông tin user
  Future<Map<String, dynamic>?> fetchUserInfo() async {
    try {
      final token = await getToken();
      if (token == null) {
        print("Token không tồn tại. Vui lòng đăng nhập lại.");
        return null;
      }
      final response = await _dio.get(
        'https://105a7394-9e19-4b48-9270-6fa500fe4b4a.mock.pstmn.io/user',
        options: Options(
          headers: {
            "Authorization": "Bearer $token", // Gửi token trong header
          },
        ),
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        print(response.data['data']['name']);
        print(response);
        return response.data['data'];
      } else {
        print("Lỗi khi lấy thông tin user: ${response.data}");
        return null;
      }
    } on DioException catch (e) {
      print('Dio error: $e');
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
    return null;
  }
}
