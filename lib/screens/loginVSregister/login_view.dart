import 'package:demo_app/models/user.dart';
import 'package:demo_app/screens/loginVSregister/login_provider.dart';
import 'package:demo_app/screens/loginVSregister/register_view.dart';
import 'package:demo_app/ui/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
              ),
              onChanged: (value) {
                ref.read(usernameProvider.notifier).state = value;
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
              ),
              obscureText: true,
              onChanged: (value) {
                ref.read(passwordProvider.notifier).state = value;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                ref.read(isLoadingProvider.notifier).state =
                    true; // Bắt đầu loading

                final username = ref.read(usernameProvider);
                final password = ref.read(passwordProvider);
                print('Username: $username');
                print('Password: $password');
                final authService = ref.read(authServiceProvider);

                final isValid = await authService.login(
                    username: username, password: password);

                ref.read(isLoadingProvider.notifier).state =
                    false; // Kết thúc loading
                print({'isValid': isValid});
                if (isValid) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(handleChangeScreen: (int) {}),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid Username or Password'),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.login),
              label: const Text('Đăng nhập'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              child: const Text('Chưa có tài khoản? Đăng ký ngay!'),
            ),
          ],
        ),
      ),
    );
  }
}
