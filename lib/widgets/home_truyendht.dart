import 'package:flutter/material.dart';

import '../models/book.dart';
import '../models/services/books_api_service.dart';

class HomeTruyendht extends StatefulWidget {
  const HomeTruyendht({super.key});

  @override
  State<HomeTruyendht> createState() => _HomeTruyendhtState();
}

class _HomeTruyendhtState extends State<HomeTruyendht> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = ApiService().fetchBooks(); // Gọi API khi khởi tạo
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: futureBooks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Book> completedBooks = snapshot.data!
              .where((book) => book.status == 'Hoàn thành')
              .toList();
          if (completedBooks.isEmpty) {
            return const Center(child: Text('Không có dữ liệu sách.'));
          }
          return _buildBooksList(completedBooks);
        } else {
          return const Center(child: Text('Không tìm thấy sách.'));
        }
      },
    );
  }

  Widget _buildBooksList(List<Book> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Truyện đã hoàn thành",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: const [
                Text(
                  "Xem thêm",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: books.map((book) => _buildBookItem(book)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBookItem(Book book) {
    return GestureDetector(
      onTap: () {
        // TODO: Xử lý khi bấm vào một cuốn sách
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(book.image ?? 'Unknown'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Tiêu đề
            SizedBox(
              width: 120,
              child: Text(
                book.title ?? 'Unknown',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 5),
            // Phụ đề
            SizedBox(
              width: 120,
              child: Text(
                book.subTitle ?? 'Unknown',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
