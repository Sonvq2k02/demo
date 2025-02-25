import 'package:demo_app/screens/writePage/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/book.dart';

class AddStoryPage extends ConsumerWidget {
  AddStoryPage({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm Thông Tin Truyện',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (titleController.text.isEmpty ||
                  subtitleController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vui lòng nhập đủ thông tin')),
                );
                return;
              }

              final newBook = Book(
                id: DateTime.now().millisecondsSinceEpoch, // ID tạm thời
                title: titleController.text,
                subTitle: subtitleController.text,
                image: imageController.text.isNotEmpty
                    ? imageController.text
                    : "https://via.placeholder.com/150",
                views: 0,
                datePublished: DateTime.now().toString(),
                dateUpdated: DateTime.now().toString(),
                chapterCount: 0,
                latestChapterDate: DateTime.now().toString(),
                commentsCount: 0,
                content: "Nội dung sẽ cập nhật sau",
                category: "Chưa có thể loại",
                status: "Đang cập nhật",
              );

              ref.read(bookProvider.notifier).addBook(newBook);
              print("Đã thêm sách: ${newBook.title}");
              Navigator.pop(context); // Quay lại màn hình trước đó
            },
            child: const Text(
              'LƯU',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Nhập URL ảnh bìa"),
                      content: TextField(
                        controller: imageController,
                        decoration: const InputDecoration(
                          hintText: "Dán URL ảnh vào đây",
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Hủy"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Xác nhận"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imageController.text.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 40, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                              'Thêm một bìa',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : Image.network(imageController.text, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Tiêu Đề Truyện',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: subtitleController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Mô Tả Truyện',
                border: UnderlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
