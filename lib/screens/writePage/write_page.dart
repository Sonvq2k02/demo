import 'package:demo_app/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/Write_getFourthSection.dart';
import '../../widgets/Write_getSecondSection.dart';
import '../../widgets/Write_getThirdSection.dart';
import '../../widgets/write_getFirstSection.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
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
            WriteGetfirstsection(),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
            WriteGetsecondsection(),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 10),
            WriteGetthirdsection(),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 10),
            WriteGetfourthsection(),
            const SizedBox(height: 10),

            //  WriteGetfifthsection()
          ],
        ),
      ),
    );
  }
}
