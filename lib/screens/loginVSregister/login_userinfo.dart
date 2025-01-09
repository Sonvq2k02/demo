import 'package:demo_app/screens/loginVSregister/login_service.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin người dùng"),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: authService.fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text("Lỗi khi tải thông tin user"));
          }

          final userInfo = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${userInfo['id']}", style: TextStyle(fontSize: 18)),
                Text("Tên: ${userInfo['name']}",
                    style: TextStyle(fontSize: 18)),
                Text("Email: ${userInfo['email']}",
                    style: TextStyle(fontSize: 18)),
                Text("Số điện thoại: ${userInfo['phone']}",
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
