import 'package:flutter/material.dart';
import '../models/book.dart'; // Import model Book

class BookdetailGetsecondsection extends StatelessWidget {
  final Book book; // Nhận đối tượng Book từ bên ngoài

  const BookdetailGetsecondsection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // Kiểm tra nếu category không null và không rỗng
    if (book.category != null && book.category!.isNotEmpty) {
      // Tách category thành danh sách các thể loại
      List<String> tags =
          book.category!.split(',').map((tag) => tag.trim()).toList();

      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Thể loại",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            // Wrap để hiển thị các thể loại
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10,
                  children: List.generate(tags.length, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                        child: Text(
                          tags[index], // Hiển thị từng thể loại
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white, // Chỉnh màu chữ để dễ đọc hơn
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Trường hợp category null hoặc rỗng
      return const Text(
        "Không có thể loại nào được chỉ định",
        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
      );
    }
  }
}
