import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookService {
  static Future<List<Book>> fetchBooks() async {
    final url = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': 'http'},
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List items = jsonData['items'];

      return items.map((e) => Book.fromJson(e)).toList();
    } else {
      throw Exception("Не вдалося завантажити книги");
    }
  }
}