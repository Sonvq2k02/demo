import 'package:flutter/material.dart';

class LibraryGetfirstsection extends StatefulWidget {
  const LibraryGetfirstsection({super.key});

  @override
  State<LibraryGetfirstsection> createState() => _LibraryGetfirstsectionState();
}

class _LibraryGetfirstsectionState extends State<LibraryGetfirstsection> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Thư viện",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      ),
    ]);
  }
}
