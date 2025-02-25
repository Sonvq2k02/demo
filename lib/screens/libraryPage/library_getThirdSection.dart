import 'package:flutter/material.dart';

class LibraryGetthirdsection extends StatefulWidget {
  const LibraryGetthirdsection({super.key});

  @override
  State<LibraryGetthirdsection> createState() => _LibraryGetthirdsectionState();
}

class _LibraryGetthirdsectionState extends State<LibraryGetthirdsection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.lock,
              color: Colors.grey[500],
              size: 13,
            ),
            const SizedBox(width: 10),
            Text(
              "Riêng tư",
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
          ],
        ),
        // Tiêu đề
        Text(
          "Tất cả truyện",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        // Danh sách cuộn ngang
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 156, // Đặt kích thước cụ thể cho Container

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hình ảnh
                          Container(
                            width: double.infinity,
                            height: 245,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          SizedBox(height: 10),
                          // Thanh tiến trình
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: Colors.black38,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Tiêu đề
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Title1",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),

                                      SizedBox(height: 5),
                                      // Subtitle
                                      Text(
                                        "sub_title",
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
                              ),
                              CircleAvatar(
                                //backgroundImage: AssetImage("  "),
                                radius: 20,
                                backgroundColor: Colors.pink,
                                child: Icon(
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
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
