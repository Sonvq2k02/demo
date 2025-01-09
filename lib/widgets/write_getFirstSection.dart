import 'package:flutter/material.dart';

class WriteGetfirstsection extends StatefulWidget {
  const WriteGetfirstsection({super.key});

  @override
  State<WriteGetfirstsection> createState() => _WriteGetfirstsectionState();
}

class _WriteGetfirstsectionState extends State<WriteGetfirstsection> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Viết",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      ),
    ]);
  }
}
