import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  _MyFirstAppState createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _loading = false;       // чи йде завантаження
  double _progressValue = 0.0; // відсоток завантаження

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          centerTitle: true,
        ),
        body: Center(
          child: _loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearProgressIndicator(value: _progressValue),
                    SizedBox(height: 20),
                    Text(
                      '${(_progressValue * 100).round()}%',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                    ),
                  ],
                )
              : Text(
                  'Text button to download',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _loading ? null : _startLoading,
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _startLoading() {
    setState(() {
      _loading = true;
      _progressValue = 0.0;
    });

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2; // збільшуємо прогрес на 20% кожну секунду
        if (_progressValue >= 1.0) {
          _loading = false;  // завершили завантаження
          _progressValue = 0.0;
          t.cancel();
        }
      });
    });
  }
}
