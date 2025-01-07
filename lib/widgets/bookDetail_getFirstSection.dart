import 'package:flutter/material.dart';

class BookdeailGetfirstsection extends StatefulWidget {
  const BookdeailGetfirstsection({super.key});

  @override
  State<BookdeailGetfirstsection> createState() =>
      _BookdeailGetfirstsectionState();
}

class _BookdeailGetfirstsectionState extends State<BookdeailGetfirstsection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "1999",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 14,
                ),
                SizedBox(width: 3),
                Text(
                  "Lần đọc",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "1999",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 14,
                ),
                SizedBox(height: 3),
                Text(
                  "Lượt bình chọn",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "1999",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Icon(
                  Icons.list,
                  size: 14,
                ),
                SizedBox(height: 3),
                Text(
                  "Số chương",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
