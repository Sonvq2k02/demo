import 'package:flutter/material.dart';

class LibraryGetsecondsection extends StatefulWidget {
  const LibraryGetsecondsection({super.key});

  @override
  State<LibraryGetsecondsection> createState() =>
      _LibraryGetsecondsectionState();
}

class _LibraryGetsecondsectionState extends State<LibraryGetsecondsection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Đọc hiện tại"),
          const SizedBox(width: 10),
          Text("Kho lưu trữ"),
          const SizedBox(width: 10),
          Text("Danh sách đọc"),
        ],
      ),
    );
  }
}
