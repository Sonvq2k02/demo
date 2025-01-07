import 'package:flutter/material.dart';

import 'package:demo_app/screens/homePage/book_detail_page.dart';

import '../models/book.dart';
import '../models/services/books_api_service.dart';

class HomeTruyendecu extends StatefulWidget {
  @override
  _HomeTruyendecuState createState() => _HomeTruyendecuState();
}

class _HomeTruyendecuState extends State<HomeTruyendecu> {
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
          List<Book> books = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Truyện đề cử",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          // Nền
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          // Nội dung
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Row(
                              children: [
                                // Ảnh bìa sách
                                Container(
                                  width: 120,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(books[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                // Title và Subtitle
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookDetailPage(
                                                title: books[index].title,
                                                subtitle: books[index].subTitle,
                                                image: books[index].image,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          //color: Colors.green,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            books[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        books[index].subTitle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
