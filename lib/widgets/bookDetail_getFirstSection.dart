import 'package:flutter/material.dart';
import '../models/book.dart'; // Import model Book

class BookdeailGetfirstsection extends StatelessWidget {
  final Book book; // Nhận đối tượng Book từ bên ngoài

  const BookdeailGetfirstsection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Số lần đọc
        Column(
          children: [
            Text(
              book.views.toString(), // Hiển thị số lần đọc
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(height: 3),
            Row(
              children: const [
                Icon(Icons.remove_red_eye_outlined, size: 14),
                SizedBox(width: 3),
                Text(
                  "Lần đọc",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
        // Lượt bình chọn
        Column(
          children: [
            Text(
              book.commentsCount.toString(), // Hiển thị lượt bình chọn
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(height: 3),
            Row(
              children: const [
                Icon(Icons.star, size: 14),
                SizedBox(width: 3),
                Text(
                  "Lượt bình chọn",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
        // Số chương
        Column(
          children: [
            Text(
              book.chapterCount.toString(), // Hiển thị số chương
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const SizedBox(height: 3),
            Row(
              children: const [
                Icon(Icons.list, size: 14),
                SizedBox(width: 3),
                Text(
                  "Số chương",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
