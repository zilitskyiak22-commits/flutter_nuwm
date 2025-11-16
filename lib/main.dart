import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StatelessWidget simple",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 166, 26, 209),
        appBar: AppBar(
          title: Text("Laborator 3"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HintLabel('Click "-" for decrement'),
              SizedBox(height: 8.0),
              CounterWidget(),
              SizedBox(height: 8.0),
              HintLabel('Click "+" for increment'),
            ],
          ),
        ),
      ),
    );
  }
}

// Власний віджет для підказок
class HintLabel extends StatelessWidget {
  final String text;

  const HintLabel(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.amber[200]),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }
}

// Кастомний StatefulWidget для лічильника
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 67, 11, 221),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _decrement,
            icon: Icon(Icons.remove, color: Colors.white),
          ),
          Text(
            '$_count',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          IconButton(
            onPressed: _increment,
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);
}
