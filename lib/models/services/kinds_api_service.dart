import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  // Hàm gọi dữ liệu tags
  Future<List<Map<String, String>>> fetchTags() async {
    try {
      final response = await dio.get(
          'https://105a7394-9e19-4b48-9270-6fa500fe4b4a.mock.pstmn.io/kinds');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['tags'];
        return data.map((tag) => {'label': tag['label'] as String}).toList();
      } else {
        throw Exception('Failed to load tags');
      }
    } catch (e) {
      throw Exception('Failed to load tags: $e');
    }
  }
}
