import 'package:demo_app/widgets/home_appbar.dart';
import 'package:demo_app/widgets/home_theloai.dart';
import 'package:demo_app/widgets/home_truyendecu.dart';
import 'package:demo_app/widgets/home_truyendtln.dart';
import 'package:demo_app/widgets/home_truyendht.dart';
import 'package:flutter/material.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            HomeAppbar(),
            const SizedBox(height: 30),
            HomeTruyendecu(),
            const SizedBox(height: 20),
            HomeTruyendtln(),
            const SizedBox(height: 20),
            HomeTheloai(),
            const SizedBox(height: 20),
            HomeTruyendht(),
          ],
        ),
      ),
    );
  }
}
