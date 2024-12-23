import 'package:demo_app/ui/main/home_page.dart';
import 'package:flutter/material.dart';

class DaksdeScreen extends StatelessWidget {
  const DaksdeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Thiết lập thời gian trì hoãn và chuyển hướng
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(handleChangeScreen: (int) {}),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0x00252525),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _buildIconDaksde(),
        //_buildText(),
      ]),
    );
  }

  Widget _buildIconDaksde() {
    return Image.asset(
      "assets/image/Daksde.png",
      width: 160,
      height: 60,
      fit: BoxFit.contain,
    );
  }

  Widget _buildText() {
    return Container(
      child: const Text(
        'Demo',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
