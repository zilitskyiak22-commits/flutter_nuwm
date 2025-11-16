import 'package:flutter/material.dart';
import 'package:flutter_application_1/book_service.dart';
import 'post_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Лабораторна №8")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Пости"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => PostScreen()));
              },
            ),
            ElevatedButton(
              child: Text("Книги"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BookScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}