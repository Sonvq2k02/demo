import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../screens/writePage/book_provider.dart';
import '../screens/writePage/book_provider.dart';

class BookdetailGetfourthsection extends ConsumerStatefulWidget {
  const BookdetailGetfourthsection({super.key});

  @override
  ConsumerState<BookdetailGetfourthsection> createState() =>
      _BookdetailGetfourthsectionState();
}

class _BookdetailGetfourthsectionState
    extends ConsumerState<BookdetailGetfourthsection> {
  bool _isExpanded = false; // Trạng thái mở rộng danh sách chương

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookProvider);
    final book = books.isNotEmpty ? books.first : null;
    final chapters = generateChapters(book?.chapterCount ?? 0);

    // Kiểm tra nếu không có chương nào
    if (book?.chapterCount == 0) {
      return const Center(
        child: Text(
          "Không có chương nào",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

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
                  const Icon(Icons.menu_book_rounded, color: Colors.black),
                  const SizedBox(width: 8),
                  Text(
                    "${book?.chapterCount} chương",
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
                  style: const TextStyle(
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
                    ? chapters.length
                    : 3, // Hiển thị tất cả hoặc chỉ 3 chương đầu
                (index) {
                  final chapter = chapters[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        chapter.title,
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        chapter.date,
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
