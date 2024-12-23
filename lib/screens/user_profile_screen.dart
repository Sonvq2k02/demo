import 'dart:convert';
import 'package:demo_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User? user; // Lưu trữ thông tin người dùng
  bool isLoading = true; // Hiển thị trạng thái tải dữ liệu
  String? errorMessage; // Lưu thông tin lỗi nếu có

  @override
  void initState() {
    super.initState();
    fetchData(); // Gọi hàm lấy dữ liệu khi màn hình được tạo
  }

  // Hàm lấy dữ liệu từ API
  Future<void> fetchData() async {
    final url =
        'https://graphapi.ttbadminton.vn/auth/v1/login'; // Đảm bảo URL đúng endpoint
    try {
      final response = await http.get(Uri.parse(url));
      print(response);
      if (response.statusCode == 200) {
        // Nếu yêu cầu thành công
        final data = json.decode(response.body);

        setState(() {
          user =
              User.fromJson(data['data']); // Chuyển JSON thành đối tượng User
          isLoading = false;
        });
      } else {
        // Nếu API trả về mã lỗi
        setState(() {
          errorMessage = 'Failed to fetch data: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      // Xử lý lỗi mạng hoặc JSON không hợp lệ
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Info')),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Hiển thị vòng loading trong khi tải dữ liệu
            : errorMessage != null
                ? Text(errorMessage!) // Hiển thị lỗi nếu có
                : user == null
                    ? Text(
                        'No user data available') // Không có dữ liệu người dùng
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name: ${user!.name ?? "N/A"}'),
                          Text('Email: ${user!.email ?? "N/A"}'),
                          Text('Phone: ${user!.phone ?? "N/A"}'),
                          Text('Birthday: ${user!.birthday ?? "N/A"}'),
                          Text(
                              'Notification: ${user!.enableNotification ?? false}'),
                          Text('Status: ${user!.status ?? "N/A"}'),
                          Text('Role: ${user!.roleTitle ?? "N/A"}'),
                          Text('Step: ${user!.step ?? 0}'),
                          Text('Balance: ${user!.balance ?? 0}'),
                        ],
                      ),
      ),
    );
  }
}
