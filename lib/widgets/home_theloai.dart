import 'package:flutter/material.dart';

import '../models/services/kinds_api_service.dart';

class HomeTheloai extends StatefulWidget {
  const HomeTheloai({super.key});

  @override
  State<HomeTheloai> createState() => _HomeTheloaiState();
}

class _HomeTheloaiState extends State<HomeTheloai> {
  late Future<List<Map<String, String>>> futureTags;

  @override
  void initState() {
    super.initState();
    // Gọi API để lấy danh sách tags
    futureTags = ApiService().fetchTags();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Thể loại",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        FutureBuilder<List<Map<String, String>>>(
          future: futureTags,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Map<String, String>> tags = snapshot.data!;

              // Chia danh sách tags thành 2 phần
              int halfway = (tags.length / 2).ceil();
              List<Map<String, String>> firstRow = tags.sublist(0, halfway);
              List<Map<String, String>> secondRow = tags.sublist(halfway);

              return Column(
                children: [
                  // Dòng đầu tiên
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: firstRow.map((tag) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 10),
                          child: Text(
                            tag['label']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Dòng thứ hai
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: secondRow.map((tag) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 10),
                          child: Text(
                            tag['label']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No tags found.'));
            }
          },
        ),
      ],
    );
  }
}
