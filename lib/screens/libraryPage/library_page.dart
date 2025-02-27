import 'package:demo_app/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

import 'library_getFirstSection.dart';
import 'library_getFourthSection.dart';
import 'library_getSecondSection.dart';
import 'library_getThirdSection.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            //HomeAppbar(),
            const SizedBox(height: 30),
            LibraryGetfirstsection(),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            LibraryGetsecondsection(),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 10),
            // LibraryGetthirdsection(),
            // const SizedBox(height: 10),
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
            LibraryGetfourthsection(),
            const SizedBox(height: 10),

            //  LibraryGetfifthsection()
          ],
        ),
      ),
    );
  }
}
