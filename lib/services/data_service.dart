import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_app/dto/news.dart';
import 'package:my_app/endpoints/endpoints.dart';

class DataService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoints.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonRespone = jsonDecode(response.body);
      return jsonRespone.map((item) => News.fromJson(item)).toList();
    }else{
      // Handle error
      throw Exception('Failed to load news');
    }
  }
}