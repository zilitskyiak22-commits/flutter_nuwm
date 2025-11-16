import 'package:flutter/material.dart';
import 'pages/register_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterFormPage(),
    );
  }
}
