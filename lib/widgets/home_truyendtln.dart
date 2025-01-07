import 'package:flutter/material.dart';

import '../models/book.dart';
import '../models/services/books_api_service.dart';

class HomeTruyendtln extends StatefulWidget {
  const HomeTruyendtln({super.key});

  @override
  State<HomeTruyendtln> createState() => _HomeTruyendtlnState();
}

class _HomeTruyendtlnState extends State<HomeTruyendtln> {
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
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<Book> completedBooks = snapshot.data!
              .where((book) => book.commentsCount >= 100)
              .toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Truyện được thảo luận nhiều",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
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
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    completedBooks.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                Container(
                                  width: 120,
                                  height: 160,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            completedBooks[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(child: Text('No books found.'));
        }
      },
    );
  }
}
