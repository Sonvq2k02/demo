import 'package:demo_app/widgets/home_truyendecu.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_truyendht.dart';

class AddStoryPage extends StatelessWidget {
  AddStoryPage({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm Thông Tin Truyện',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // String title = titleController.text;
              // String subTitle = subtitleController.text;

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeTruyendecu(
              //       title: title,
              //       subtitle: subTitle,
              //     ),
              //   ),
              // );
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
                // Hành động thêm ảnh bìa
                print("Thêm ảnh bìa");
              },
              child: Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
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
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Tiêu Đề Truyện',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
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
