import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/homePage/book_detail_page.dart';
import '../screens/writePage/book_provider.dart';

class HomeTruyendtln extends ConsumerWidget {
  const HomeTruyendtln({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider); // Lắng nghe cập nhật từ Provider

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(books);
    });

    if (books.isEmpty) {
      return const Center(child: Text("Chưa có truyện nào!"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Truyện được thảo luận nhiều",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("Xem thêm", style: TextStyle(fontSize: 14)),
                SizedBox(width: 3),
                Icon(Icons.arrow_forward_ios, size: 14),
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: books.map((book) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailPage(
                        bookId: book.id!,
                        book: book,
                      ),
                    ),
                  );
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
                                image: NetworkImage(book.image ?? ''),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      // Giới hạn chiều rộng của Text và cắt bớt nếu vượt quá
                      SizedBox(
                        width: 120,
                        child: Text(
                          book.title ?? "Không có tiêu đề",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          book.subTitle ?? "Không có mô tả",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
