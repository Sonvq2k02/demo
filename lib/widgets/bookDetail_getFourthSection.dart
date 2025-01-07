import 'package:flutter/material.dart';

import '../models/services/bookdetail_json/bookDetail_json.dart';

class BookdetailGetfourthsection extends StatefulWidget {
  const BookdetailGetfourthsection({super.key});

  @override
  State<BookdetailGetfourthsection> createState() =>
      _BookdetailGetfourthsectionState();
}

class _BookdetailGetfourthsectionState
    extends State<BookdetailGetfourthsection> {
  bool _isExpanded =
      false; // Biến trạng thái để hiển thị hoặc thu gọn danh sách chương

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.menu_book_rounded, color: Colors.black),
                  const SizedBox(width: 8),
                  Text(
                    "${chapters.length} chương",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? "Ẩn" : "Xem tất cả",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.purple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Danh sách chương
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              children: List.generate(
                _isExpanded
                    ? chapters.length // Hiển thị tất cả nếu mở rộng
                    : 3, // Hiển thị 3 chương mới nhất nếu rút gọn
                (index) {
                  // Lấy chương mới nhất khi rút gọn
                  final chapter = _isExpanded
                      ? chapters[index]
                      : chapters[chapters.length - 1 - index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        chapter["title"],
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        chapter["date"],
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
