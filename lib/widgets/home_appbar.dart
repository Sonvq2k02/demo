import 'package:demo_app/screens/loginVSregister/login_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/loginVSregister/login_service.dart';
import '../screens/loginVSregister/login_userinfo.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Image.asset(
        //   "assets/image/Daksde.png",
        //   width: 160,
        //   height: 60,
        //   color: Colors.black,
        //   fit: BoxFit.contain,
        // ),
        Text(
          "Logo",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () async {
            final authService = AuthService();
            final isLoggedIn =
                await authService.checkLoginStatus(); // Dùng hàm từ AuthService

            if (isLoggedIn) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfoPage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            }
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple[400],
            child: FutureBuilder<String?>(
              future: SharedPreferences.getInstance()
                  .then((prefs) => prefs.getString('username')),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.data != null) {
                  return Text(
                    snapshot.data![0]
                        .toUpperCase(), // Hiển thị ký tự đầu tiên của username
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  );
                } else {
                  return const Icon(Icons.person,
                      color: Colors.black, size: 24);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
