import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/services/books_api_service.dart';

class BookdeatilGetfifthsection extends StatefulWidget {
  const BookdeatilGetfifthsection({super.key});

  @override
  State<BookdeatilGetfifthsection> createState() =>
      _BookdeatilGetfifthsectionState();
}

class _BookdeatilGetfifthsectionState extends State<BookdeatilGetfifthsection> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = ApiService().fetchBooks(); // Lấy dữ liệu từ API
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bạn cũng có thể thích",
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
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: books.map((book) {
                    return GestureDetector(
                      onTap: () {
                        // Xử lý khi nhấn vào sách
                      },
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
                                    image: NetworkImage(book.image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ]),
                            SizedBox(height: 10),
                            Container(
                              width: 120,
                              child: Text(
                                book.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 120,
                              child: Text(
                                book.subTitle,
                                maxLines: 2,
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
                  }).toList(),
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
