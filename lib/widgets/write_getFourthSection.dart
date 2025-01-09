import 'package:flutter/material.dart';

class WriteGetfourthsection extends StatelessWidget {
  const WriteGetfourthsection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Tapped on 'Viết 1 truyện mới'");
        // Navigator.push(
        //   context, MaterialPageRoute(builder: (context) => WritePage()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.library_add, size: 30),
          const SizedBox(width: 10),
          Text(
            "Viết 1 truyện mới",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
