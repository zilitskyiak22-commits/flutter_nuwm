import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/book_servise.dart';
import 'models/book.dart';

class BookScreen extends StatefulWidget {
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    books = BookService.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Книги (Google Books)")),
      body: FutureBuilder<List<Book>>(
        future: books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Помилка: ${snapshot.error}"));
          }

          final list = snapshot.data!;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final book = list[index];

              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.author ?? "Автор невідомий"),
              );
            },
          );
        },
      ),
    );
  }
}