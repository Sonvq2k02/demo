import 'package:flutter/material.dart';
import 'package:demo_app/utils/bottom_sheet_helpers.dart';

import '../../models/models.dart';
import '../../models/services/books_api_service.dart';
import '../../widgets/bookDeatil_getFifthSection.dart';
import '../../widgets/bookDetail_getFirstSection.dart'; // Đã cập nhật để nhận Book
import '../../widgets/bookDetail_getFourthSection.dart';
import '../../widgets/bookDetail_getSecondSection.dart';
import '../../widgets/bookDetail_getThirdSection.dart';

class BookDetailPage extends StatefulWidget {
  final int bookId;

  const BookDetailPage({super.key, required this.bookId});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    futureBook = ApiService().fetchBookById(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Book>(
      future: futureBook,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          final book = snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(180),
              child: _CustomAppBar(
                title: book.title ?? 'No Title',
                subtitle: book.subTitle ?? 'No Subtitle',
                image: book.image ?? '',
              ),
            ),
            body: _getBody(book), // Truyền Book vào Body
          );
        } else {
          return const Scaffold(
            body: Center(child: Text('No data available')),
          );
        }
      },
    );
  }
}

// Widget AppBar tùy chỉnh
class _CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const _CustomAppBar({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.headphones, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () => getBottomSheetListening(context),
                        icon: const Icon(Icons.settings, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}

// Widget Body tùy chỉnh, nhận Book làm tham số
Widget _getBody(Book book) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        BookdeailGetfirstsection(book: book), // Truyền Book vào đây
        const SizedBox(height: 30),
        BookdetailGetsecondsection(book: book), // Truyền Book vào đây
        const SizedBox(height: 10),
        BookdetailGetthirdsection(book: book),
        const SizedBox(height: 10),
        const BookdetailGetfourthsection(),
        const SizedBox(height: 30),
        const BookdeatilGetfifthsection(),
      ],
    ),
  );
}
