import 'package:flutter/material.dart';
import 'package:demo_app/utils/bottom_sheet_helpers.dart';

import '../../widgets/bookDeatil_getFifthSection.dart';
import '../../widgets/bookDetail_getFirstSection.dart';
import '../../widgets/bookDetail_getFourthSection.dart';
import '../../widgets/bookDetail_getSecondSection.dart';
import '../../widgets/bookDetail_getThirdSection.dart';

class BookDetailPage extends StatelessWidget {
  final String title; // Tiêu đề
  final String subtitle; // Phụ đề
  final String image;

  const BookDetailPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: _CustomAppBar(
          title: title,
          subtitle: subtitle,
          image: image,
        ),
      ),
      body: getBody(),
    );
  }
}

// Widget AppBar tùy chỉnh
class _CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const _CustomAppBar(
      {required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Hình nền

        Stack(
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
        // Lớp phủ mờ

        // Nội dung tiêu đề và nút bấm

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

// Widget Body tùy chỉnh
Widget getBody() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        BookdeailGetfirstsection(),
        SizedBox(height: 30),
        BookdetailGetsecondsection(),
        SizedBox(height: 10),
        BookdetailGetthirdsection(),
        SizedBox(height: 10),
        BookdetailGetfourthsection(),
        SizedBox(height: 30),
        BookdeatilGetfifthsection()
      ],
    ),
  );
}
