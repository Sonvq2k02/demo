import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../writePage/book_provider.dart';

class LibraryGetfourthsection extends ConsumerWidget {
  const LibraryGetfourthsection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: books.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];

                return GestureDetector(
                  onTap: () {
                    // Xử lý khi bấm vào sách
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ảnh sách
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: book.image != null
                                ? DecorationImage(
                                    image: NetworkImage(book.image!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Thanh tiến trình
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              height: 5,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Tiêu đề & Subtitle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.title ?? "Không có tiêu đề",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    book.author ?? "Không có tác giả",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.pink,
                              child: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
