import 'package:flutter/material.dart';

import '../models/services/bookdetail_json/bookDetail_json.dart';

class BookdetailGetsecondsection extends StatefulWidget {
  const BookdetailGetsecondsection({super.key});

  @override
  State<BookdetailGetsecondsection> createState() =>
      _BookdetailGetsecondsectionState();
}

class _BookdetailGetsecondsectionState
    extends State<BookdetailGetsecondsection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thể loại",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          // Wrap để hiển thị các tags trong 2 dòng
          Container(
            //color: Colors.red,
            child: SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10,
                  children: List.generate(tags.length, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 10),
                        child: Text(
                          tags[index]['label'],
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
