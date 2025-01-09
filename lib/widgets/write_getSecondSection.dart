import 'package:flutter/material.dart';

import '../screens/writePage/add_story.dart';

class WriteGetsecondsection extends StatefulWidget {
  const WriteGetsecondsection({super.key});

  @override
  State<WriteGetsecondsection> createState() => _WriteGetsecondsectionState();
}

class _WriteGetsecondsectionState extends State<WriteGetsecondsection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddStoryPage()));
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
